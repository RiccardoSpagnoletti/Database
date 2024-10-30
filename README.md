# Database Management System for Smart Buildings

This project involves designing a relational database on Oracle MySQL to manage data related to the construction, maintenance, and monitoring of buildings with a focus on safety.

## Project Overview

The database stores information for a smart building system used by a company managing construction and renovation projects. The goal is to enhance building safety by enabling efficient risk assessment and predictive maintenance through data collection and analysis.

## Project Requirements

The project is divided into several key phases:

### 1. Specification Analysis
   - Carefully analyze the project specifications to understand the data requirements and determine the optimal organization of data. [Specification_ITA](Project/Progetto_Basi_di_dati_2022.pdf)

### 2. Conceptual Design
   - Create an Entity-Relationship (E-R) diagram that includes entities, attributes, associations, and cardinalities, following the course's notation. [Diagram_E-R](Project/E-R_non_ristrutturato.pdf)

### 3. E-R Diagram Restructuring
   - Refine the initial E-R diagram by removing generalizations and complex attributes, preparing it for translation into a relational model. [Diagram_E-R](Project/E-R_ristrutturato.pdf)

### 4. Identifying Data Operations
   - Define at least 8 significant operations (queries, inserts, updates, deletions) for managing the data effectively. These operations should help optimize the database's performance under typical workloads.

### 5. Performance Analysis
   - Document and evaluate the performance of the identified operations. This includes creating tables that summarize access patterns and data volumes, analyzing operation frequency, and considering potential performance improvements through redundancy.

### 6. Logical Design
   - Translate the refined E-R diagram into a relational schema. Implement referential integrity constraints where required.

### 7. Functional Dependency and Normalization
   - Ensure the database schema is in Boyce-Codd Normal Form (BCNF). If normalization conflicts with performance optimization (due to redundancy), clearly document these choices.

### 8. Database Implementation on MySQL
   - Develop a MySQL script that creates the database and populates tables with sample data. The script should include:
      - Referential integrity constraints
      - Triggers to enforce business rules
      - Stored procedures for data analytics

### 9. Data Analytics Implementation
   - Implement backend procedures to support the following analytics functions:
      - **Intervention Recommendations**: Generate recommendations for building maintenance based on sensor data.
      - **Damage Estimation**: Predict potential building damage following events like earthquakes.
      - **Custom Analytics (optional)**: Provide an additional analytics function relevant to building monitoring and safety.

## Deliverables

The final deliverables include:
- **Database**: The MySQL script to create and populate the database.
- **Documentation**: A detailed document explaining each design choice, including:
   - The initial and restructured E-R diagrams.
   - Performance analysis of operations.
   - Rationale behind each decision, particularly in areas like redundancy and functional dependencies.
   - An explanation of each implemented analytic function.


This project was developed for the **Computer Engineering** program at the **University of Pisa** under the supervision of Prof. Gigliola Vaglini and Ing. Francesco Pistolesi.

---

**Note**: This project is educational and was developed solely as part of a university course.
