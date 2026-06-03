## Project Overview
An end-to-end data analysis project that analyzes the effects of delivery time and its differences between states. A retention heat map was also created to see whether customer loyalty is a top priority. This project leveraged multiple skills to get the final output such as SQL, pandas, Seaborn, etc. The data was retrieved from Kaggle from the following link: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

## Objectives
* **To see what is the overall sales trajectory.**
* **To check the retention percentages of customers.**
* **To see if delays in delivery affects ratings.**
* **To find which state suffers the most from delays in shipping.**

## Tech Stack
* **Python (Pandas, NumPy, Seaborn, Matplotlib) & Jupyter Notebooks:** Used for loading data into SQL server as well as generating figures for data analysis.
* **SQL/SQL Server:** Used to to store the data downloaded from kaggle and querying.
* **SQLAlchemy:** Used for Data Extraction and Connectivity.

## Key Insights
* **Key Insight 1:**
    ![summary_image](images\summary.png)
    * From the table, I wanted to check a high level overview of the sales trajectory. The data was only captured from year 2016 - 2018, making this analysis applicable for roughly only 2 years. We can see that revenue started pouring in at the start of 2017 and has seen a steady increase in unique customers throughout the year.
* **Key Insight 2:**
    ![customer_retention](images\customer_retention_cohorts_heatmap.png)
    * For this figure, I had to divide the data into cohorts, with each cohort being the first time a customer has ordered. Afterwards, a retention matrix was created to check which customers come back to purchase again. Consulting the graph, the data indicates that customer retention is low, hinting that the business focus is shifted more towards acquiring new customers than retaining previous ones.
* **Key Insight 3:**
    ![average_slippage](images\average_delivery_slippage_barplot.png)
    * In this bar plot, I checked to see if there is any corrolation between a delay in delivery and the rating given by the customers. As seen above, if the order is delivered before the estimated deliver date (a negative value denotes an early delivered date) the ranking comes is higher which could mean that a delay in delivery leads worse rankings.
* **Key Insight 4:**
    ![deliver_slippage_distribution](images\deliver_slippage_distribution_boxplot.png)
    * Based on the box plot above, we can see that there is major variance when it comes to shipping times, a shared characteristic between all of the states. The state of Acre is seen having the "best" delivery times while the state of Alagoas having the "worst" delivery times. Geographically, Acre and Alagoas are on the opposite sides of Brazil, west and east, respectively. If we go by the assumption that products are shipped from the north-western side of Brazil, then it would be recommended to possibly increase the estimated delivery time of the product to account for this geographical hurdle. 