# Bollywood Cultural Trends Analysis

This repository contains the code and data for a project collecting and scraping relevant data about Bollywood movies and doing a thematic content and sentiment analysis. The goal is to classify movies by key social themes across several ideological dimensions.

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
  - 

---

## Project Pipeline

### 1. **Data Collection**
- **Source:** IMDb IDs and movie metadata.
- **Enrichment:** Plot summaries scraped from Wikipedia pages using BeautifulSoup and requests.

### 2. **Data Cleaning**
- Normalize and preprocess text: lowercasing, punctuation removal, filtering non-English summaries, etc.

### 3. **Theme Classification**
- Use pre-trained multi-label text classifiers (Hugging Face LLMs) to tag each plot for the presence of major themes.
- Manual verification for edge cases and ambiguous outputs.

### 4. **Sentiment Scoring**
#### Rationale
Instead of relying on binary or scalar sentiment scores (e.g., positive/negative), the analysis uses a custom multidimensional sentiment approach. This allows for a more nuanced classification of the ideological tone.

#### Proposed Sentiment Measure:
- Each ideological axis (e.g., Feminist—Misogynistic) is treated as a **semantic polarity dimension**.
- Plots are scored using transformer-based sentiment models that interpret tone in the context of domain-specific prompts.
- Final scores are standardized and normalized for comparison.

### 5. **Visualization & Analysis**
- ggplot2 used for trend graphs over time
- Comparison across decades, directors, and genres

---

## Repository Structure

```plaintext
Bollywood_Trends_Analysis/
├── README.md                  ← You're here!
├── archive/                   ← The original dataset
├── notebooks/
│   ├── 01_data_scraping.ipynb    ← Script for scraping plot summaries
│   ├── 02_theme_classification.ipynb ← LLM-based theme tagging
│   └── 03_sentiment_scoring.ipynb ← Custom sentiment scoring code
├── data/
│   └── classified_data.csv       ← Tagged and Labeled Movie Dataset with imdb ids for merging
│   └── plot_poster_data.csv      ← Dataset containing the synopsis and movie poster for the sampled movies 
├── plots/                     ← matplotlib and ggplot2 visualisations
├── classified_data.csv        ← 
├── sampled_100_movies.csv     ← Randomly Sampled 100 movies with ALL attribiutes of the original dataset
├── requirements.txt           ← Python dependencies
├── supplementary_ideas.md     ← Supplementary Ideas 
