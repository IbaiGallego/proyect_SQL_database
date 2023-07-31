# SQL Database for Blockbuster

![blockbuster](https://github.com/Ironhack-Data-Madrid-Julio-2023/w3-project_SQL/assets/49964118/10d05dab-0f3e-45dc-8d0b-6c4f39986625)

*Commit 1*

## 1. Preparations

   On this project I have to create an SQL database for blockbuster. The idea is that they will reopen and they need a new database for their stores. I have the data of their old store and I have to clean it and design the relations between the tables.

   Before I can start working I created a jupyter notebook file to cconnect to MySQL server and i created an empty database/schema to begin working from there.

   The first step is to understand the data. I will use the pandas library to load the .csv files and observe what type of data I am working with. I will start designing the ERD while i understand the data and the inner structure of the business.

## 2. Look at the Data

The first step is to understand the data. For this I load all the csv into dataframes from pandas and print the .head() of each df. It's important when importing pandas to set the option show all columns with this code:

      pd.set_option('display.max_columns', None)

We start looking at the data to understand the relationships that need defining. Once I have this I will know which data to clean and which to preserve. The process will require a lot of updates and changes throughout the code. I will sequentialy describe my findings going back ad forth from cleaning, understanding and modelling the ERD.

## 3. Development

### 3.1 First Look

Issues:

1. There is no Customer table. It needs to be created with the relevant customer data.

2. The Update column doesn't fulfill any purpose. If you don't plan on keeping a history of every movement for future analisis it doesn't make sense.

3. Old information on rental needs to be deleted. We need the table to start from the day they reopen.

4. They are only opening one store so in innventory id we wouldn´t need to declare the store. This may change, decition will be taken later.

5. Some films might be missing from the inventory. If there are no copies of them we should delete the file. It could also be very interesting to have a way of knowinng if the film is rented or not. I will add a column in the inventory table that determines the availability. 

6. Actors that don't appear on any film should also be cleaned.

7. Language and Category tables don't need the update time.

8. Intermediate table for Film, Actor relationship. old_HDD has the information needed for that intermediate table.

### 3.2 EDR V1

After looking at the data and writting down the relations between the data this is the structure.

<img src="https://github.com/Ironhack-Data-Madrid-Julio-2023/3.3-lab_mysql_advanced/assets/49964118/6985c056-0e4c-4d4b-9439-4c5fbbf03a50" alt="EDR" width="300" height="300">

*Commit 2,3 and 4*

### 3.3 Cleaning the data.

1. Deleting 'last update' columns in all tables.

2. Deleting unnecessary columns on films e.g. 'original_language_id'

3. Changing actor names from 'old' to actor_id and cleaning unnecessary columns. Joining the columns on first and last into full_name column

*commit 5 and 6*

4. Category to film table. The information on the film category in in the old table. The category column belongs in the film table so i made i function to add the value chequing for every unique element in the tuple set of values.

5. delete store id from inventory. There is only one store

*commit 7 and 8*

After cleaning the data I have to design the remaining tables (staff, customer) and create the query using reverse engineering EDR from MySQLWorkbennch to create the database.

### 3.4 Designing the Structure

Ill show the end result, I defined the columns of the missing tables to finish getting the tables. Here is the EDR:

![EDR](https://github.com/Ironhack-Data-Madrid-Julio-2023/3.3-lab_mysql_advanced/assets/49964118/664e6e41-074b-4ebf-8b6d-6651d922d2b3)

*Here we cann see all the tables and their contents as well as the relationships between them.*

*Commit 9*

### 3.5 Uploading the data

To upload the data first we forward engineer the EDR. After that we upload all the newly creared .csv files from the pandas database. We import each table infividuality going from the outer tables that donnt have foreign keys to the inner more conected ones. The we use the data export in the server option in MySQL Workbench annd create the dump file blockbuster.sql.

*Commit 10 y 11*