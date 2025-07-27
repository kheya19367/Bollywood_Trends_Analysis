# Bollywood Cultural Trends Analysis

This repository contains the code and data for a project collecting and scraping relevant data about Bollywood movies and doing a sentiment analysis. The goal is to classify movies by key social themes across several ideological dimensions.

## Project Objectives

- Identify and classify key themes in Bollywood movie plots such as:
  - Hindu–Muslim relations
  - Gender Dynamics 
  - Nationalism
  - Caste Dynamics 
- Quantify sentiment along ideological axes:
  - **Secular — Exclusionary**
  - **Feminist — Misogynistic**
  - **Progressive — Conservative**
  - **Egalitarian — Casteist**

---

## Project Pipeline

### 1. Data Sourcing and Integration
- The primary dataset was sourced from [The Indian Movie Database](https://www.kaggle.com/datasets/pncnmnp/the-indian-movie-database).
- Multiple files were merged to create a **master movie file** with comprehensive metadata and attributes.
- A sample of 100 movies released after 2010 was selected to ensure the thematic and sentiment analysis was current and consistent.

### 2. Collection of Movie Materials

#### a. Subtitle Files
- Initial efforts to collect `.srt` subtitle files via **OpenSubtitles** were blocked due to access restrictions.
- **Subscene** and **YIFY** were explored as alternatives, but English subtitle coverage was insufficient or scraping attempts were blocked.
- As a result, **subtitle data was not used** in the final analysis.

#### b. Plot Summaries
- **Wikipedia** was the primary source for full plot summaries.
- If a Wikipedia plot was unavailable:
  - The project defaulted to the summary provided in the original dataset.
  - If neither was available, the **TMDb API** was used to fetch the official movie description.
- This layered fallback system ensured the dataset remained robust while also maintaining efficiency and consistency.

#### c. Visual Metadata
- Movie **poster images** were collected using the **TMDb API** for supplementary visual analysis.

#### d. Descriptive Metadata
- **Director gender** was scraped from **Wikipedia**, and inferred via the **Genderize.io API** where information was unavailable.
- **Box Office performance** was obtained using the **OMDB API**.

### 3. Thematic Classification 
- To measure the ideological sentiment embedded within Bollywood movie plots, a custom **thematic classification pipeline** was implemented using **zero-shot learning**.

---

## Thematic Classification & Ideological Sentiment Mapping


### Approach

- Each movie plot was evaluated on four major socio-political axes:
  - **Hindu–Muslim relations:** *Secular* - *Exclusionary*
  - **Gender dynamics:** *Feminist* - *Misogynistic*
  - **Nationalism:** *Tolerant* - *Jingoistic*
  - **Caste representation:** *Egalitarian* - *Casteist*

- A zero-shot classification pipeline from Hugging Face was used to assign the most likely label to each plot across these axes. This method allows classification without needing labeled training data.

### Rationale and Model Choice

- Initially, large language model APIs such as Groq and OpenAI were considered to better capture contextual nuance in longer plots. However, due to token size limitations and pricing constraints, they were not viable for a larger dataset (Espescially keepin in mind that the analysis should theoretically be abled to be carried out on movie subtitle files).
- Several Hugging Face models (`facebook/bart-large-mnli`, `roberta-large-mnli`) were also tested, but caused session crashes and memory overflow errors due to their size and the amount of data.
- Ultimately, **`cross-encoder/nli-distilroberta-base`** was selected for its lightweight architecture, compatibility with CPU and GPU environments, and reliable zero-shot performance without requiring fine-tuning.

> **Note:** It is recommended to run the classification pipeline on **Google Colab with GPU enabled** for optimal performance. The code also runs on CPU, but with significantly longer processing times.

---
## Rationale for Chosen Axes

The chosen axes reflect key socio-political themes that have consistently appeared  Bollywood cinema and are central to public discourse in India. Each axis captures a dimension of ideological framing, making them well-suited for the analysis of a movie's positioning on contentious social issues.

### Hindu–Muslim Relations *(Secular - Exclusionary)*  
This axis reflects how films represent interreligious dynamics, especially in the context of India's increasingly polarized political landscape. Films may depict either inclusive, pluralistic relationships or align with majoritarian narratives. This axis captures communal framing and religious inclusivity.

### Gender Dynamics *(Feminist - Misogynistic)*  
This axis gauges whether films challenge or reinforce patriarchal structures. It is particularly relevant in evaluating female agency, objectification, and representation in mainstream cinema.

### Nationalism *(Tolerant - Jingoistic)*  
This axis evaluates whether patriotism is framed through inclusive, democratic ideals or through aggressive, jingoistic, and exclusionary forms of nationalism.

### Caste Dynamics *(Egalitarian - Casteist)*  
Given the centrality of caste in Indian society, it can serve as a critical lens to analyse cinema. This axis captures whether caste dynamics are portrayed in an equitable manner or whether stereotypical and regressive depictions are present or normalised.

---

### 5. **Visualization & Analysis**
- ggplot2 used for sentiment trend graphs over time
- matplotlib and seaborn used to create summary plots for the additional metadata 
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
