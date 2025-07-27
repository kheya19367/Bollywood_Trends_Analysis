# Supplementary Ideas for Dataset Enrichment

For deepening the cultural, political, and representational analysis of Bollywood films, the dataset can be enriched with additional metadata that captures the complexity of the narrative, character dynamics, and audience reception beyond conventional markers. Below are three proposed attributes that go beyond commonly used metadata to offer a novel and fresh analytical dimension.

---
## 1. **Primary Narrative Setting (Geographic & Cultural Context)**
This attribute aims to capture the geographic or cultural setting of the film's narrative. For instance, a film may be set in a village in Haryana, Mumbai, or in London, or even a fictional realm. Capturing such elements can help in uncovering regional representation biases in Bollywood, urban-rural divides and the portrayals of specific communities.
Spatial and cultural framing oftentimes affects how themes like caste, gender, and religion are expressed. Analysing such trends can help uncover industry preferences for certain social environments or how political narratives are geographically anchored.

**Data Source / Method:**  
- Use NLP-based **Named Entity Recognition (NER)** on the plot or summary to extract place names.
- Cross-reference with TMDb or Wikipedia “Setting” sections (scraped via BeautifulSoup).
---
## 2. **Proportion of Female Cast in Top-Billed Roles**  
Numeric Measures (ex: 0.33, 0.5) of the share of female actors in the top three to five billed cast members, based on the credited cast order can also serve a useful metric. Such a measure can help provide a standardized and comparable measure of gender inclusion at the forefront across narratives. 

**Collection Method:**  
- Use IMDb, TMDb APIs or scrape via Wikipedia to extract top-billed cast.
- Gather information on the actors’ gender via their Wikipedia page and use `Genderize.io` infer the gender via the actors’ name in the absence of information on Wikipedia.
- Compute proportion: `number of female cast members / total top-billed cast `.

---

## 3. **Explicit Mention of Political Figures or Events**  
A binary variable (ex: `0` = no explicit mention, `1` = explicit mention ) can be created to flag whether the film makes direct reference to real-life political parties, leaders, or historical events (e.g., “Emergency,” “Congress,” “BJP,” “Nehru”).
Political messaging in Bollywood has grown more overt in recent years. Capturing explicit references enables tracking of ideological positioning and engagement with real-world politics.

**Collection Method:**  
- Scan `plot` and `subtitles (.srt files)` for keywords using a **curated political lexicon**.
- Can consider Manual validation for ambiguous terms or false positives.
---
These structured attributes are directly implementable in the dataset and can be used to complement the current sentiment and thematic tagging work. Each proposed additon supports a quantitative extension of cultural and political inquiry into Bollywood’s evolving content landscape.

