###############################################################
# Acknowledgments and Library Sources
# - base R: core statistical functions for modeling and diagnostics
# - car: diagnostic tools for non-constant variance, outlier influence, etc.
###############################################################
if (!require(car)) install.packages("car")
library(car)

###############################################################
# 1. Import and Prepare Data
###############################################################
data <- read.csv("data/raw_data.csv", header = TRUE, stringsAsFactors = FALSE)

# Check structure and summaries
str(data)
summary(data)

# Clean data: remove missing values
clean_data <- data[!is.na(data$face_value_amount) & !is.na(data$county), ]

# Create binary predictor for Appropriative rights
clean_data$is_approp <- ifelse(clean_data$water_right_type == "Appropriative", 1, 0)

###############################################################
# 2. Simple Linear Regression Model
###############################################################
# Model: face_value_amount ~ is_approp
lm_result <- lm(face_value_amount ~ is_approp, data = clean_data)

# View regression output: Parameter estimation (b0, b1), t-stats, p-values, R^2
summary(lm_result)
# Extract coefficients
b0 <- coef(lm_result)[1] # Intercept, mean allocation for Other Types
b1 <- coef(lm_result)[2] # Slope, mean difference for Appropriative rights

###############################################################
# 3. Inference: Confidence and Prediction Intervals
###############################################################
# Confidence interval for slope (b1)
confint(lm_result) # Returns CIs for both b0 and b1

# Prediction intervals for new observation
predict(lm_result, newdata = data.frame(is_approp = 1), interval = "prediction")
predict(lm_result, newdata = data.frame(is_approp = 0), interval = "prediction")

###############################################################
# 4. Model Diagnostics (Plots and Formal Tests)
###############################################################

# (A) Residuals vs Fitted Values (for Linearity & Variance)
plot(lm_result$fitted.values, lm_result$residuals,
     xlab = "Fitted Values", ylab = "Residuals",
     main = "Residuals vs Fitted Values")
abline(h = 0, col = "red")

# (B) Non-constant variance (heteroscedasticity) formal test
ncvTest(lm_result)

# (C) Q-Q plot for normality of residuals
qqnorm(lm_result$residuals)
qqline(lm_result$residuals, col = "red")

# (D) Cook's Distance (influential outliers)
plot(lm_result, which = 4)

# (E) Residuals vs observation order (check independence)
plot(seq_along(lm_result$residuals), lm_result$residuals,
     xlab = "Observation Order", ylab = "Residuals",
     main = "Residuals vs Observation Order")
abline(h = 0, col = "red")

###############################################################
# 5. Save Cleaned Analysis Data
###############################################################
write.csv(clean_data, "data/clean_data.csv", row.names = FALSE)

###############################################################
# 6. Plain English Explanations (for Report)
###############################################################
# Intercept (b0): "The estimated mean water allocation for \"Other Types\" is b0 acre-feet/year."
# Slope (b1): "Appropriative rights receive, on average, b1 acre-feet/year more than Other Types."
# R-squared: "The near-zero R-squared shows right type explains only a tiny fraction of total variance in allocation."
# Confidence Interval: "95% CI for the mean group difference includes only positive values, confirming statistical significance."
# Prediction Interval: "Extremely wide prediction intervals reveal the model is a poor predictor for new allocations."
# Diagnostics: "Plots and formal tests show major assumption violations; see Discussion for caveats and remediation."

###############################################################
# END OF ANALYSIS SCRIPT
###############################################################