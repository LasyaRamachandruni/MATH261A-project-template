# California Water Rights Allocation – Simple Linear Regression Analysis  

**Course:** MATH261A – San José State University  
**Author:** Lasya Ramachandruni  
**Date:** September 24, 2025  

---

## 📌 Overview  
This repository presents an analysis of California surface water allocations using a **Simple Linear Regression (SLR)** approach.  
The primary objective is to estimate the **mean difference in annual water allocation** between **Appropriative** and **Other Types** water rights, and to document the full workflow, including limitations encountered during real data analysis.  

---

## 📂 Folder Structure  

/data
├── raw_data.csv # Raw water rights data from California Open Data portal
└── clean_data.csv # Cleaned & transformed data for regression analysis

/analysis
└── *.R # Scripts for import, cleaning, regression, diagnostics, plotting

/paper
├── report.qmd/.Rmd # Project report in Quarto or R Markdown
├── report.pdf # Rendered report
├── tables/ # Final tables
└── figures/ # Final graphics

yaml
Copy code

---

## 🔄 Project Workflow  

### 1. Data Preparation  
- Clean and transform the original dataset.  
- Construct binary predictor variable: **Appropriative = 1, Other Types = 0**.  
- Summarize major data features, outliers, and missing values.  

### 2. Regression Modeling  
- Model:  

  \[
  Y_i = \beta_0 + \beta_1 X_i + \epsilon_i
  \]  

- Parameters estimated using **least squares**.  

### 3. Inference and Diagnostics  
- Conduct hypothesis testing, confidence intervals, and prediction intervals.  
- Diagnostics performed include:  
  - Residuals vs Fitted & Observation Order plots  
  - Q-Q plot for normality  
  - Cook’s distance (influence)  
  - Heteroscedasticity tests  

> All diagnostic results are included in the discussion of model assumptions and limitations.  

### 4. Reporting  
- Report written in **Quarto** for reproducibility and transparency.  
- All figures and tables stored in `/paper`.  

---

## 📊 Key Findings & Limitations  
- **Significant mean difference** detected between Appropriative and Other Types.  
- **Violations of assumptions**: constant variance and normality not satisfied.  
- **Influential outliers** detected.  
- Predictions are **unreliable**, but group mean differences remain interpretable.  

---

## 📜 Data Source & License  
- **Dataset:** [California Water Rights List](https://data.ca.gov/)  
- **Source:** California Open Data  
- **License:** [Open Data Commons Public Domain Dedication and License (PDDL 1.0)](https://opendatacommons.org/licenses/pddl/1-0/)  

This project exclusively uses **public domain government data**.  

---

## ⚙️ How to Reproduce / Run  

1. Open the project in **RStudio** (`.Rproj` provided).  
2. Install required packages (see `/analysis` scripts).  
3. Run scripts in `/analysis` to:  
   - Clean the data  
   - Fit regression models  
   - Run diagnostics  
4. Compile the final report in `/paper` using **Quarto** (or R Markdown).  

---

## 📚 References  
- [California Open Data Portal](https://data.ca.gov/)  
- [R Project](https://cran.r-project.org/)  
- [Quarto](https://quarto.org/)  
- [Open Data Commons PDDL License](https://opendatacommons.org/licenses/pddl/1-0/)  

---

## 🙏 Acknowledgments  
- **SJSU MATH261A** faculty and staff for guidance.  
- Open Data initiatives and online communities (**RStudio Community**, **Stack Overflow**, **ChatGPT Edu**) for template/cod
