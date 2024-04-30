App Store Analysis: Extract, Transform, Load (ETL) and Visualization

### Overview
This project involves data extraction, transformation, loading (ETL), and analysis of a dataset related to Shopify app store apps (created by developers) and reviews (published by shops). The dataset is regularly updated but to get the latest data the Shopify App store scraper can be used directly. The analysis is performed using SQL queries, and the results are visualized using Tableau.

### Dataset
The dataset used in this project is "https://www.kaggle.com/datasets/usernam3/shopify-app-store". It consists of several tables, including:
- `apps`: Contains information about various apps, such as app ID, title, developer, rating, and tagline.
- `categories`: Stores the categories of apps with their corresponding IDs.
- `app_categories`: Represents the relationship between apps and categories.
- `key_benefits`: Includes key benefits or features of each app.
- `pricing_plans`: Contains details about pricing plans offered by different apps.
- `reviews`: Stores user reviews for different apps.

### Analysis
The following analyses were performed using SQL queries:
- Summary statistics of app ratings and reviews count.
- Analysis of ratings by category.
- Count of apps in each category.
- Count of pricing plans for each app.
- Identification of top-rated apps.
- Analysis of pricing plan features and key benefits.
- Sentiment analysis of user reviews.
- Identification of top developers based on the number of apps.
- Identification of top categories by average rating.
- Ranking of apps within each category by reviews count.
- Identification of the most common key benefits across apps.
- Calculation of the average price of pricing plans across apps.
- Identification of the top apps with the most expensive pricing plans.
- Ranking of developers with the highest average rating.
- Analysis of the most active categories by the number of apps.

### Tableau Visualizations
- Apps and Ratings: Visualized app ratings and other relevant metrics.
- Top Developers: Highlighted top developers based on the number of apps.
- Category-wise App Count: Displayed the distribution of apps across categories.
- App Rating vs. Rating Count: Explored the relationship between app ratings and review counts.
- Category with Pricing: Visualized pricing plans across different categories.

### Project Structure
- `data_extraction`: Contains scripts for extracting data from the source.
- `data_transformation`: Includes scripts for cleaning and transforming the data.
- `data_analysis`: Contains SQL scripts for performing data analysis.
- `visualization`: Includes Tableau workbooks and dashboards for visualizing the results.
- `README.md`: Provides an overview of the project, dataset, analysis, and visualization.

### Requirements
Excel, MySQL, Tableau

