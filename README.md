California Water Rights Allocation – Simple Linear Regression Analysis
Course: MATH261A – San José State University
Author: Lasya Ramachandruni
Date: September 24, 2025

Overview
This repository presents a complete analysis of California surface water allocations using a Simple Linear Regression (SLR) approach. The primary objective is to estimate the mean difference in annual water allocation between "Appropriative" and "Other Types" water rights, and to document the full workflow including limitations encountered in real data analysis.

Folder Structure
/data:

raw_data.csv: Raw water rights data as downloaded from the California Open Data portal.

clean_data.csv: Data cleaned and transformed for regression analysis.

/analysis:

R scripts for data import, cleaning, regression model fitting, diagnostics (including outlier/influence checks), and plotting.

/paper:

Project report written in Quarto/R Markdown, rendered as PDF.

Final tables, graphics, and reference files.

Project Workflow
Data Preparation:

The original dataset is cleaned and transformed, with a binary variable constructed for the predictor (Appropriative: 1, Other Types: 0).

Major data features and quality issues (outliers, missingness) are summarized.

Regression Modeling:

A classical SLR model: $Y_i = \beta_0 + \beta_1 X_i + \epsilon_i$

Parameters estimated using least squares.

Inference and Diagnostics:

Hypothesis testing, confidence intervals, and prediction intervals produced.

Diagnostics include:

Residuals vs Fitted and Observation Order plots

Normality of errors (Q-Q plot)

Influence statistics (Cook’s distance)

Heteroscedasticity tests

All diagnostic results are incorporated into discussion and documentation of model limitations.

Reporting:

Report written in Quarto, emphasizing reproducibility, transparency, and explicit discussion of all assumptions and findings.

Figures and tables placed in /paper for easy review.

Data Source and License
Dataset: California Water Rights List

Source: California Open Data

License: Open Data Commons Public Domain Dedication and License (PDDL 1.0)

This project exclusively uses public domain government data.

How to Reproduce/Run
Open the project in RStudio using the provided .Rproj file.

Install required packages (see setup instructions in /analysis scripts).

Run scripts in /analysis to clean and analyze the data.

Compile the report in /paper using Quarto (or R Markdown) to produce the final PDF.

Key Findings & Limitations
SLR detects a significant mean difference in allocation between Appropriative and Other Types.

Diagnostics reveal severe violations of constant variance and normality; influential outliers are present.

Model interpretation and prediction intervals should be considered unreliable except for robust group mean estimates.

All caveats and limitations are rigorously documented.

References
California Open Data Portal: https://data.ca.gov/

R Project: https://cran.r-project.org/

Quarto: https://quarto.org/

Open Data Commons PDDL License: https://opendatacommons.org/licenses/pddl/1-0/

Acknowledgments
SJSU MATH261A faculty and staff for guidance.

Template and code support from Open Data initiatives and online communities (RStudio Community, Stack Overflow, ChatGPT Edu).
