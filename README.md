# Bollywood Cultural Trends Analysis

This repository contains the code and data for a project collecting and scraping relevant data about Bollywood movies and doing a sentiment analysis. The goal is to classify movies by key social themes across several ideological dimensions.

## Project Objectives

- Identify and classify key themes in Bollywood movie plots such as:
  - Hindu–Muslim relations
  - Gender representation
  - Nationalism
  - Caste Dynamics 
- Quantify sentiment along ideological axes:
  - **Exclusionary — Secular**
  - **Feminist — Misogynistic**
  - **Progressive — Conservative**
  - **Egalitarian - Casteist**

---

## Project Pipeline

### 1. Data Sourcing and Integration
- The primary dataset was sourced from [The Indian Movie Database](https://www.kaggle.com/datasets/pncnmnp/the-indian-movie-database).
- Multiple files were merged to create a **master movie file** with comprehensive metadata and attributes.
- A sample of **100 movies released after 2010** was selected to ensure the thematic and sentiment analysis was current and consistent.

### 2. Collection of Movie Materials

#### a. Subtitle Files
- Initial efforts to collect `.srt` subtitle files via **OpenSubtitles** were blocked due to access restrictions.
- **Subscene** was explored as an alternative, but English subtitle coverage was insufficient.
- As a result, **subtitle data was not used** in the final analysis.

#### b. Plot Summaries
- **Wikipedia** was the primary source for full plot summaries.
- If a Wikipedia plot was unavailable:
  - The project defaulted to the **summary provided in the original dataset**.
  - If neither was available, the **TMDb API** was used to fetch the official movie description.
- This layered fallback system ensured the dataset remained **robust** while also maintaining **efficiency and consistency**.

#### c. Visual Metadata
- Movie **poster images** were collected using the **TMDb API** for supplementary visual analysis.

#### d. Descriptive Metadata
- **Director gender** was scraped from **Wikipedia**, and inferred via the **Genderize.io API** where information was unavailable.
- **Box Office performance** was obtained using the **OMDB API**.


### 5. **Visualization & Analysis**
- ggplot2 used for trend graphs over time
- Comparison across decades, directors, and genres

---

## Repository Structure

```plaintext
Bollywood_Trends_Analysis/
├── README.md                                  ← You're here!
├── archive/                                   ← The original dataset (The Indian Movie Database)
├── notebooks/
│   ├── Movie Sampling.ipynb                   ← Script for merging all attributes from the dataset and sampling 100 movies released post 2010
│   ├── Bollywood_Analysis_Tasks.ipynb         ← Script for scraping plot, poster and other metadata + sentiment classification 
│   └── Graph_Sentiment_Classification.R       ← R code for making graphs to visualise sentiment classification results 
├── data/
│   └── classified_data.csv                    ← Tagged and Labeled Movie Dataset with imdb ids for merging
│   └── plot_poster_data.csv                   ← Dataset containing the synopsis and movie poster for the sampled movies 
├── plots/                                     ← matplotlib and ggplot2 visualisations
├── sampled_100_movies.csv                     ← Randomly Sampled 100 movies with ALL attribiutes of the original dataset
├── requirements.txt                           ← Python dependencies
├── supplementary_ideas.md                     ← Supplementary Ideas 
