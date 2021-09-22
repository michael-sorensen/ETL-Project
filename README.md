# ETL-Project
<img src="/analysis/twitter-mask.jpg" align="left" width="100px"/>
This database contains summary statistics about COVID-19 cases, public health mandates, and public compliance for every U.S. state, as well as over 20,000 tweets about masks from users accross the country. The database timeframe is May-August of 2020.
<br>

## Data Extraction
The database was constructed from two data sources.
#### 1. "Mask Adherence and Rate of COVID-19 across the United States"<br>
<sup><sub>Fischer CB, Adrien N, Silguero JJ, Hopper JJ, Chowdhury AI, Werler MM (2021) Mask adherence and rate of COVID-19 across the United States. PLoS ONE 16(4): e0249891. https://doi.org/10.1371/journal.pone.0249891</sup></sub>
This dataset was downloaded in a CSV format. Each row represented a U.S. State and contained columns for a variety COVID-19 related metrics for each month in the May-August timeframe, as well as demographic data for each state.

#### 2. Twitter Data (snscrape)
Snscrape is a scraper tool for social media data. Using snscrape's sntwitter with a python wrapper, 1000 tweets were scraped for the 10 queries listed below, for each of the five months.
* #maskmandate
* masks are ""
* #mask
* mask & public
* mask & mandate
* mask & CDC
* wearing a mask is ""
* mask & children OR mask & kids
* mask & government

For each tweet scraped, the following data was collected:

* Tweets ID
* Tweet Date
* Tweet content
* Username
* User location
* User ID

All the data scraped was put into a pandas dataframe and exported as a CSV file ('tweets_raw.csv')


## Data Transformation
For the COVID-19 data, the metrics were separated into seperate dataframes for each month.




First, the raw twitter data was loaded into a dataframe, which contained 38,262 unique tweets. Then the month of each tweet was extracted from the 'tweet.date' timestamp and added as a new variable 'Month', and tweets without user location were dropped from the dataframe.

Because user location is a self-reported variable, there was little consistancy in the variable values. For example, a user may report their location as "Southern Colorado", "Miami, FL", or "BEAUTIFUL SUNNY CALIFORNIA!". To standardize user location, the variable was mapped using a function that referenced dictionaries to convert state abbreviations (e.g. AK), full state names ("California"), and major cities ("Seattle"), to full state names. If a user location contained no references to a city or state it was dropped from the dataframe. This standardized location variable was added as 'State'.

```Python
import nltk.sentiment.vader
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
```
Given there is little analysis that can be done with solely textual data, each tweet was analyzed using NLTK's Sentiment Analyzer module. A sentiment analyzer is a process of contextual text analyses, which determines whether a statement (in this case a tweet), is negative, positive, or neutral.

using






​
* **L**oad: the final database, tables/collections, and why this was chosen.
​


  Adherance to Mask Policy
  Total COVID-19 Cases
  Strictness of Policy (bool)
  Mask Policy in Effect (bool)
  Average Week Case Rate
  Average Monthly Case Rate
