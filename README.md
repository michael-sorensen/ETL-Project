# COVID-19 MASK DATA & TWITTER SENTIMENTS
<img src="/analysis/twitter-mask.jpg" align="left" width="100px"/>
This database contains summary statistics about COVID-19 cases, public health mandates, and public compliance for every U.S. state, as well as over 4,000 tweets about masks from users accross the country. The data timeframe is May-August of 2020.
<br>
<br>
<br>

## Data Extraction
**The database was constructed from two data sources:**
### 1. Mask Adherence and Rate of COVID-19 across the United States<br>
<sup><sub>Fischer CB, Adrien N, Silguero JJ, Hopper JJ, Chowdhury AI, Werler MM (2021) Mask adherence and rate of COVID-19 across the United States. PLoS ONE 16(4):e0249891.https://doi.org/10.1371/journal.pone.0249891</sup></sub><br>
This dataset was downloaded in a CSV format. Each row represented a U.S. State and contained columns for a variety of COVID-19 related metrics (for each month in the May-August timeframe), as well as demographic data for each state.

### 2. Twitter Data (snscrape)
Snscrape is a scraper tool for social media data. Using snscrape's [sntwitter](https://github.com/JustAnotherArchivist/snscrape) with a python wrapper, 1000 tweets were scraped for the 10 queries listed below, for each of the five months (information on Twitter [advanced search query syntax](https://github.com/igorbrigadir/twitter-advanced-search)).

* #maskmandate
* masks are \* 
* #mask
* mask & public
* mask & mandate
* mask & CDC
* wearing a mask is \* 
* (mask & children) OR (mask & kids)
* mask & government

For each tweet scraped, the following data was collected:
* Tweet ID
* Tweet Date
* Tweet content
* Username
* User location
* User ID

All the data scraped was put into a pandas dataframe and exported as a CSV file [tweets_raw.csv](tweets_raw.csv).

<br>

## Data Transformation
### Covid Data
<kbd><img src="/analysis/covid-data-ex-2.png" width="100%"/></kbd><br>
We used a raw csv from an online medical journal, PLOS ONE, that researched mask adherence and rate of Covid-19 across the United States and the District of Columbia.

We provided separate data sets for each month from April to October of 2020 . Because policies varied from month-to-month, statistics for each month were inconsistent and we needed placeholder columns in order to have data frames with consistent columns. 

```Python
sep_df = df[['State', 'AdhSEPavg', 'tot_cases_Sep', 'case_rate_Sep', 'MaskSepPol', 'Wk_case_rate_Sep', 'Wk_SepHI', 'maskSEP75', 'strictSepPol']]
```
We dropped columns that provided “0” values. We placed NaN values for columns that did not exist in a given month. In order to merge our Covid mask data with the tweets dataset, a "Month" column was created to match the format in the tweets csv. The following statistics were used in each “Month” dataset:

* **Adh %** population that self-reported mask adherence
* **Pop %** population overall
* **Mask[month]** Mask policy in public spaces
  * 0 No mask mandate in place in a specific month
  * 1 Mask mandate recommended in place in a specific month
* **Strict[month]** Policy that required masks in public spaces with consequences in the form of fines
* **Tot_case** # of total Covid cases
* **Case_rate** number of new cases divided by the population
* **Wk_case_rate** 2 week rate divided by the population
* **Wk_HI** Highest number recorded in a specific month


### Twitter Data
<kbd><img src="/analysis/twitter-data-ex.png" width="100%"/></kbd><br>
#### Cleaning
First, the raw twitter data was loaded into a dataframe, which contained 38,262 unique tweets. Then the month of each tweet was extracted from the 'tweet.date' timestamp and added as a new variable 'Month', and tweets without user location were dropped from the dataframe.

Because user location is self-reported, there was no standardization in the variable values. For example, a user may report their location as "Southern Colorado", "Miami, FL", or "BEAUTIFUL SUNNY CALIFORNIA!". To standardize user location, the variable was mapped using a function that referenced dictionaries to convert state abbreviations (e.g. AK), full state names ("California"), and major cities ("Seattle"), to full state names. If a user location contained no references to a city or state it was dropped from the dataframe. This standardized location variable was added as 'State'.

#### Sentiment Analysis
Given there is minimal analysis that can be done with solely textual data, each tweet was analyzed using [NLTK's Sentiment Analyzer](https://www.nltk.org/api/nltk.sentiment.html) module. A sentiment analyzer is a process of contextual text analyses, which determines whether a statement (in this case a tweet), is negative, positive, or neutral.

```Python
import nltk.sentiment.vader
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

for sentence in tweets_df['tweet.content']:
    vs = analyzer.polarity_scores(sentence)
    pos_list.append(vs['pos'])
    neg_list.append(vs['neg'])
    neu_list.append(vs['neu'])
    comp_list.append(vs['compound'])
```

Using NLTK's Sentiment Analyzer module, each tweet was assigned values for four new variables "Positive",	"Negative",	"Neutral", and "Compound". The "Positive",	"Negative",	and "Neutral" variables are on a 0-1 scale, with 1 being the highest likelihood that the statement can be categorized by that variable. (In other words, if a tweet has a .9 "Negative" value, it's highly probable the sentiment of the tweet is negative). The "Compound" variable is on a -1 to 1 scale, with -1 representing negative sentiments and 1 representing positive. To further clean the data, all tweets with a completely neutral evaluation (0 compound value) were dropped.

Finally, the dataset was exported to a CSV file [tweets_final.csv](tweets_final.csv).

<br>

## Data Loading
Once the data frames were finalized, they were connected and loaded into the Mask_Data database created in PostgreSQL and formatted using pgAdmin 4. We loaded our data frames to SQL because of the relational nature of the data. We used the Months and State column to compare our Month dataframes and our Tweet data frame. A Total of eight tables were created in this database. The code for creating the tables in PostgreSQL can be found in the file titled [mask_data_colums.sql](mask_data_colums.sql). An example:

```SQL
CREATE TABLE may (
"State" VARCHAR,
"Month" VARCHAR,
"adh_MAYavg" DEC,
"tot_cases_May" INT,
"case_rate_May" DEC,
"Wk_case_rate_May" DEC,
"strictMayPol" INT,
"maskMAY75" INT,
"MaskMayPol" INT,
"Wk_MayHI" INT
);

```

Once the tables were created, the data from the 8 dataframes created by the imported CSV files in Pandas, was imported using SQLAlchemy. The code pd.read_sql_query was used in Pandas to verify that the data loaded properly into each SQL table. The eight tables included 7 month tables (April-October) and 1 tweets table. The [Final_ETL.ipynb](Final_ETL.ipynb) file is where the Pandas code is located.

Here is a simple merge command to show an example of how the tables could be combined for analysis.
```Python
merge_df = pd.merge(tweets_final_df, apr_data_df, on = "Month" and "State")
```

