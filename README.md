# 🛒 E-Commerce Customer Behavior Analysis

An end-to-end **Customer & Business Analytics project** using a synthetic Indian e-commerce dataset of **5,000 customers**.

The project analyzes customer profiles, spending, purchasing behavior, engagement, conversion, acquisition channels, returns, loyalty, membership and churn using **Python, PostgreSQL and Power BI**.

---

## 🎯 Project Objective

To analyze customer behavior and identify patterns in **customer value, purchasing activity, conversion, acquisition, returns and churn**, and translate the findings into actionable business recommendations.

---

## 🔄 Analytics Workflow

**Dataset → Pandas EDA → PostgreSQL Analysis → Power BI Dashboard → Business Insights & Recommendations**

---

## 🐍 Python / Pandas Analysis

Used **Pandas** for data inspection, cleaning, transformation and exploratory analysis.

### Data Preparation
- Inspected dataset structure using `shape`, `info()`, `describe()` and missing-value analysis.
- Standardized column names.
- Converted date columns to datetime.
- Handled missing values in discount amount, support contacts and membership tier.
- Created **Age Groups** and **Product View Groups** for segmentation.

### Exploratory Analysis
Analyzed:

- Customer distribution by age, gender, state and membership
- Customer spending by age group and product category
- Median and distribution of customer spending
- Relationship between order frequency and spending
- Product-category popularity and revenue
- Average Order Value (AOV)
- Discount usage and order behavior
- Product returns and return behavior
- Product views → cart additions → checkout activity
- Device-level conversion
- Acquisition-channel performance
- Payment-method usage and spending
- Loyalty segments and customer spending
- Customer churn and churn rates
- Delivery preferences
- Customer rating and spending

---

## 🗄️ PostgreSQL / SQL Analysis

Used **PostgreSQL** to perform structured business analysis on the cleaned dataset.

### SQL Techniques Used

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`
- `HAVING`
- `CASE` statements
- Conditional aggregation
- Subqueries
- Numeric casting
- Window functions:
  - `ROW_NUMBER()`
  - `RANK()`
  - `LAG()`
- `PARTITION BY`

### Business Analysis Performed

- Product-category revenue and order performance
- Loyalty-segment spending
- Payment-method performance
- State-level revenue analysis
- High-value customer identification
- High-frequency / low-spending customer identification
- Customers with no returns
- Highly engaged customers with low conversion
- Category-level discount usage
- Age-group revenue and spending
- Category-level return rates
- Acquisition-channel efficiency
- Device-level customer activity and spending
- Membership-tier performance
- Customer value segmentation
- Customers spending above the overall average
- Top-spending customers within each state
- Customer spending compared with state averages
- Customer order activity using `LAG()`
- State-wise customer ranking
- Churn rate by membership tier
- Highly engaged churned customers

---

## 📊 Power BI Dashboard

Built an interactive **4-page Power BI dashboard**:

### 1. Executive Overview
Provides a high-level view of:
- Customers
- Revenue
- Orders
- Average Order Value
- Product-category revenue
- State-level revenue
- Customer loyalty

### 2. Customer Profile & Segmentation
Analyzes:
- Age groups
- Gender
- Membership tiers
- Customer spending
- Loyalty segments
- Average Order Value by membership

### 3. Customer Behavior & Conversion
Analyzes:
- Product views
- Cart additions
- Checkout starts
- Conversion funnel
- Acquisition-channel revenue
- Device conversion
- Acquisition-channel conversion

### 4. Retention, Returns & Churn
Analyzes:
- Churned customers
- Churn rate
- Loyalty-based churn
- Product-category return rates
- Membership-based churn
- Sessions by churn status

---

## 📁 Project Files

| File | Description |
|---|---|
| `indian_ecommerce_customer_behavior_5000.csv` | Original dataset |
| `ecommerce_pandas_eda.ipynb` | Python/Pandas EDA and data preparation |
| `ecommerce_analysis.sql` | PostgreSQL business analysis |
| `customer_behavior_analysis.pbix` | Power BI dashboard |
| `Ecommerce_Customer_Behavior_Project_Report.pdf` | Detailed project report |

---

## 📌 Key Outcome

The project combines **data cleaning, exploratory analysis, SQL business querying and interactive visualization** to understand the complete customer journey—from customer profile and engagement to purchasing, returns and churn.

The detailed findings, business insights and recommendations are documented in the **Project Report**.

---

## 🛠️ Tools Used

**Python | Pandas | PostgreSQL | Power BI | Jupyter Notebook | SQL**
