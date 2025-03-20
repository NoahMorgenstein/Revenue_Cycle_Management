# Revenue Cycle Management (RCM) SQL & Python Portfolio

## A Brief Exercise using Python and SQL for RCM ETL and Analysis

## File Structure

* RCM-Portfolio
* Sanity_check.sql         
* Denials.sql              
* Revenue.sql              
* RCM_Data_Pipeline.ipynb  
* sample_claims_data.csv   
* README.md                


## Sample Data (created in Python): `sample_claims_data.csv`
- **Records:** 500+ claims
- **Columns:**
  - `claim_id`: Unique claim identifier
  - `patient_id`: ID of the patient
  - `submission_date`: Date the claim was submitted
  - `insurance_provider`: Name of the insurance company
  - `claim_status`: Status (`Approved`, `Denied`, `Pending`, `Paid`)
  - `amount`: Claim amount in USD
  - `denial_reason`: If denied, reason for denial

## SQL Basics
### `Sanity_check.sql` (Data Validation)
- Checks **data integrity** after ingestion.
- Validates **schema, duplicates, and null values**.
- **Key Queries:**
  ```sql
  SELECT COUNT(*) FROM claims;  -- Total records
  DESCRIBE claims;  -- Schema check
  SELECT claim_id, COUNT(*) FROM claims GROUP BY claim_id HAVING COUNT(*) > 1;  -- Duplicates
  ```

### `Denials.sql` (Denial Rate Analysis)
- Tracks **denial trends and reasons**.
- Groups **denials by provider and reason**.
- **Key Queries:**
  ```sql
  SELECT COUNT(*) FROM claims WHERE claim_status = 'Denied';
  SELECT denial_reason, COUNT(*) FROM claims WHERE claim_status = 'Denied' GROUP BY denial_reason;
  ```

### `Revenue.sql` (Financial Analysis)
- Calculates **total revenue and outstanding claims**.
- Groups **revenue by provider and claim status**.
- **Key Queries:**
  ```sql
  SELECT ROUND(SUM(amount), 2) AS Total_Revenue FROM claims WHERE claim_status IN ('Approved', 'Paid');
  SELECT insurance_provider, ROUND(SUM(amount),2) AS Revenue FROM claims WHERE claim_status IN ('Approved', 'Paid') GROUP BY insurance_provider;
  ```

## 🐍 Python Script: `RCM_Data_Pipeline.ipynb`
- **Ingests CSV data into MySQL**.
- Uses **pandas, pymysql, and SQLAlchemy**.
- **Automates SQL loading** for analysis.
- **Key Steps:**
  ```python
  import pandas as pd
  import pymysql
  from sqlalchemy import create_engine
  df = pd.read_csv("sample_claims_data.csv")
  engine = create_engine("mysql+mysqlconnector://user:password@host/database")
  df.to_sql(name="claims", con=engine, if_exists="append", index=False)
  ```

## Execution
* **Run Python script** to load data into MySQL.  
* **Execute SQL scripts** in MySQL Workbench.  
* **Analyze insights** on denials & revenue.  



