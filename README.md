# Personality Traits & Drug Use

This project analyzes how psychological traits—like impulsivity, openness, and conscientiousness—are related to psychoactive substance use using a real-world behavioral dataset of over 1,800 individuals.

## What I Did
- Used a dataset that includes personality and drug use data from 1,800+ individuals
- Focused on the Big Five personality traits + impulsivity and sensation seeking
- Categorized people as **users** or **non-users** based on whether they had tried any of 6 substances (e.g., cannabis, ecstasy, LSD, etc.)
- Performed group comparisons using **Welch’s t-tests**
- Created visual summaries using `ggplot2` in R

## Personality Traits Explained

| Trait         | Description |
|---------------|-------------|
| **Nscore** *(Neuroticism)* | Measures emotional instability. Higher scores mean more prone to anxiety, mood swings, and stress. |
| **Escore** *(Extraversion)* | Measures sociability and outgoingness. High scorers tend to be energetic and enjoy social interactions. |
| **Oscore** *(Openness)* | Reflects curiosity, imagination, and openness to new experiences or ideas. |
| **AScore** *(Agreeableness)* | Reflects cooperativeness and compassion. Low scores can mean more critical or competitive. |
| **Cscore** *(Conscientiousness)* | Indicates self-discipline, organization, and responsibility. |
| **Impulsive** | Measures the tendency to act quickly without thinking—related to risk-taking. |
| **SS** *(Sensation Seeking)* | Assesses desire for novel, intense, or risky experiences. |

These traits are commonly used in behavioral psychology, and this dataset includes standardized scores for each.

## Key Findings

- **Users of psychoactive substances scored:**
  - Higher in: `Neuroticism`, `Openness`, `Impulsivity`, and `Sensation Seeking`
  - Lower in: `Agreeableness` and `Conscientiousness`
  - No meaningful difference in: `Extraversion`
- These differences were statistically significant based on p-values < 0.05 for all except `Extraversion`.

### Sample Plot
See `Drug Plot.pdf` for a visualization of average scores by group (User vs. Non-User).

## 📁 Dataset Source
[Drug Consumption Dataset on Kaggle](https://www.kaggle.com/datasets/obeykhadija/drug-consumptions-uci?resource=download)

## 📂 Files in This Repo
- `Drug analysis and code.R`: Full analysis code written in R
- `Drug Plot.pdf`: Bar plot of average personality traits by group
- `summary.md`: Summary of methods, results, and interpretation
