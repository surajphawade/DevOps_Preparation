# Azure Data Factory – Optum

## Q1. What is Azure Data Factory?
### Answer
A cloud ETL/ELT service for data movement and transformation.
### Follow-Up Points
- Code-free UI  
- Supports pipelines  
### Example
Copy data → transform via mapping data flow.

---

## Q2. Types of Integration Runtimes.
### Answer
Azure IR, Self-hosted IR, SSIS IR.
### Follow-Up Points
- Azure IR → cloud  
- Self-hosted → on-prem  
### Example
Azure IR for blob → SQL.

---

## Q3. Types of Data Flows in ADF.
### Answer
Mapping Data Flow and Wrangling Data Flow.
### Follow-Up Points
- Mapping = ETL  
- Wrangling = PowerQuery  
### Example
Mapping Data Flow for transformations.

---

## Q4. What is Mapping Data Flow?
### Answer
A visual ETL layer inside ADF to perform transformations at scale.
### Follow-Up Points
- Uses Spark internally  
### Example
Filter, join, aggregate in GUI.

---

## Q5. Use of Mapping Data Flow?
### Answer
To transform data without writing code.
### Follow-Up Points
- For structured transformations  
### Example
Remove nulls → join tables.

---

## Q6. What is Wrangling Data Flow?
### Answer
Uses Power Query for interactive data shaping.
### Follow-Up Points
- Best for analysts  
### Example
PowerQuery UI for transformation.

---

## Q7. How do you configure Integration Runtime?
### Answer
Create IR → assign region → link to pipeline → assign compute.
### Follow-Up Points
- Self-hosted for on-prem  
### Example
Data → IR → SQL.

---

## Q8. Difference between ADF vs Databricks?
### Answer
ADF = ETL Orchestration  
Databricks = Big data compute engine with notebooks.
### Follow-Up Points
- Databricks uses Spark  
### Example
ADF triggers notebook.

---

## Q9. What activities have you used in ADF?
### Answer
Copy, ForEach, Lookup, Web, Databricks, SQL, Wait.
### Follow-Up Points
- Pipelines and triggers  
### Example
Copy from Blob → SQL.

---

## Q10. Difference between Mapping DF and Data Flow?
### Answer
Mapping Data Flow is the GUI ETL engine; Data Flow is the general concept.
### Follow-Up Points
- All mapping data flows are data flows  
### Example
ADF embedded Spark job.

---

## Q11. How do you monitor ADF pipelines?
### Answer
Use Monitor tab → run history → alerts → Log Analytics integration.
### Follow-Up Points
- Configure alerts  
### Example
Pipeline failure notification.

