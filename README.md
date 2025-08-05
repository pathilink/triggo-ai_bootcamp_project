# Health Insights Brazil - Data Platform Project

![Status Badge](https://img.shields.io/static/v1?label=STATUS&message=INCOMPLETE&color=FFCC00)

## 📁 Project Overview

This project simulates a real-world Data Engineering solution for Health Insights Brazil, a startup focused on optimizing public health data analysis from DataSUS. The goal is to build an end-to-end data pipeline using Databricks (Delta Lake) and dbt, following cloud architecture best practices, with adaptability to Snowflake environments.

## 💡 Problem Statement

DataSUS provides massive volumes of public health data, but the lack of structured, timely insights hinders hospitals, researchers, and policymakers. The objective of this project is to:

* Ingest raw data from DataSUS into a cloud Data Lake.

* Transform and model data into an analytical schema.

* Ensure data quality and documentation.

* Provide a reliable data foundation for reporting and insights.

## 📋 Project Kanban

You can follow the development workflow and current project status through the **Health Insights Brazil - Data Engineering Workflow** board on GitHub Projects:

➡️ [View Kanban Board on GitHub Projects](https://github.com/users/pathilink/projects/2)

This Kanban tracks tasks across the full data pipeline lifecycle:
- Data ingestion (DataSUS to Delta Lake)
- dbt transformations and data modeling
- Orchestration plans and CI/CD improvements
- Documentation and innovation tasks (dashboards, privacy strategies)

Status columns include **To Do, In Progress, Done** to provide a transparent view of the workflow.

## 🗂️ Data source
| Database | What it contains | Relevant issues |
| --- | --- | --- |
| [**SINASC (Sistema de Nascidos Vivos)**](https://datasus.saude.gov.br/nascidos-vivos-desde-1994) | Data on births, prematurity, birth weight, type of delivery | - Prematurity and associated factors (maternal age, region)<br>- Cesarean sections vs. natural births (evolution by state) |
                                                       
## 🛠️ Technologies used

![AWS](https://img.shields.io/badge/-AWS-232F3E?style=flat&logo=amazonaws&logoColor=white)
![Databricks](https://img.shields.io/badge/-Databricks-EF3E3E?style=flat&logo=databricks&logoColor=white)
![dbt](https://img.shields.io/badge/-dbt-FF694B?style=flat&logo=dbt&logoColor=white)
![Python](https://img.shields.io/badge/-Python-blue?style=flat&logo=python&logoColor=yellow)
![PySpark](https://img.shields.io/badge/-PySpark-222?style=flat&logo=apache-spark&logoColor=E4682A)


## 👩🏻‍💻 Author

[![Linkedin Badge](https://img.shields.io/badge/-Patrícia-blue?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/pathilink/)](https://www.linkedin.com/in/pathilink/)

## 🔓 License

[![License: MIT](https://img.shields.io/badge/License-MIT-750014.svg)](https://opensource.org/licenses/MIT)