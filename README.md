# ETL-Project
<img src="/analysis/twitter-mask.jpg" align="left" width="100px"/>
This database contains summary statistics about COVID-19 cases, public health mandates, and public compliance for every U.S. state, as well as over 20,000 tweets about masks from users accross the country. The database timeframe is May-August of 2020.
<br>

## Data Extraction
The database was constructed from two data sources.
#### 1. "Mask Adherence and Rate of COVID-19 across the United States"<br>
<sup><sub>Fischer CB, Adrien N, Silguero JJ, Hopper JJ, Chowdhury AI, Werler MM (2021) Mask adherence and rate of COVID-19 across the United States. PLoS ONE 16(4): e0249891. https://doi.org/10.1371/journal.pone.0249891</sup></sub>
This dataset was downloaded in a CSV format. Each row represented a U.S. State and contained columns for a variety COVID-19 related metrics for each month in the May-August timeframe. 

#### 2. Twitter Data (snscrape)
Snscrape is a scraper tool for social media data. Using snscrape's sntwitter with a python wrapper, 1000 tweets were scraped for the following 10 queries, for each of the five months.
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





* **T**ransform: what data cleaning or transformation was required.
​
* **L**oad: the final database, tables/collections, and why this was chosen.
​


  Adherance to Mask Policy
  Total COVID-19 Cases
  Strictness of Policy (bool)
  Mask Policy in Effect (bool)
  Average Week Case Rate
  Average Monthly Case Rate
