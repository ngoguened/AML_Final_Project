# Predicting Change in Stock Price from Influential Tweets

## Project Overview
This project aims to predict changes in Tesla's stock price using tweets from influential figures on platform X, primarily focusing on Elon Musk's tweets.

## Motivation
Tweets by influential individuals often cause significant market speculation. Understanding these impacts could aid in financial analysis and automated trading strategies.

## Data Collection
- Use the Twitter API to gather Elon Musk's tweets.
- Use financial data APIs (e.g., Alpha Vantage, Finnhub) to get Tesla stock prices.
- Label data by calculating the average stock price change within a set number of seconds following each tweet timestamp.

## Methodology
1. Preprocess and vectorize tweet text.
2. Formulate the problem as:
   - Regression: Predict continuous stock price change.
   - Classification: Predict stock price movement (up/down).
3. Establish baseline models (e.g., linear regression).
4. Explore advanced models, including deep neural networks.
5. Expand dataset to other influential figures if necessary.
6. Reframe the task as classification if regression performs poorly.

## Simplest Implementation Steps

### Step 1: Data Collection [CURRENT]
- Set up access to Twitter API for Elon Musk’s tweets.
- Set up access to financial API for Tesla stock prices.
- Write scripts to synchronize tweets with stock price data.
- Generate labels for model training based on price changes after tweets.

### Step 2: Data Preprocessing
- Clean tweet text (tokenize, remove stop words).
- Vectorize text using TF-IDF or word embeddings.
- Align text vectors with labeled price changes.

### Step 3: Baseline Model
- Implement a linear regression model predicting price changes.
- Train and evaluate using regression metrics such as MSE.

### Step 4: Advanced Modeling
- Implement more complex models, e.g., neural networks.
- Tune hyperparameters and validate model results.
- Optionally, reframe as classification and train models accordingly.

### Step 5: Evaluation and Iteration
- Analyze model performance and accuracy.
- Expand dataset or adjust problem framing if needed.
- Iterate on models and preprocessing techniques.

## Team Members
- Nicholas Goguen-Compagnoni (ng547)
- Pranav Dhingra (pd453)
