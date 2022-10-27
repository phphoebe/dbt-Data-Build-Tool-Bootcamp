Happy Modeling! 

## [The Complete dbt (Data Build Tool) Bootcamp: Zero to Hero](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/) | Udemy

Instructors: Zoltan C. Toth & Miklos (Mike) Petridisz

## Part 1 - Theory
* ETL & ELT
* Data Warehouses, Data Lakes and Lakehouses 
* The Modern Data Stack
* Slow Changing Dimension (SCD)

## Part 2 - Practice

* dbt-core Setup
* Models 
* Materializations
* Seeds and Sources 
* Snapshots
* Tests
* Macros, Custom Tests and Packages 
* Documentation 
* Analyses, Hooks and Exposures 
* Debugging Tests and Testing with dbt-expectations

## Project Progress

#### 1. dbt-core setup

1. Install Python3 virtualen
* `brew install virtualenv`
2. Create a virtualenv
* `virtualenv venv`
3. Activate virtualenv
* `. venv/bin/activate`
4. Install dbt-snowflake
* `pip install dbt-snowflake`
* `which dbt` *- should be in your venv folder*

Create a new dbt project:
* `dbt init dbtlearn`

| config | value |
| --- | --- |
| role (dev role) | transform |
| warehouse | COMPUTE_WH |
| database | airbnb |
| schema | dev |

#### 2. Staging Layer - Source Models created


<img width="954" alt="image" src="https://user-images.githubusercontent.com/64668691/194973414-bbea6191-3b15-4cd7-8415-d0048983d28e.png">

<img width="1441" alt="image" src="https://user-images.githubusercontent.com/64668691/194973649-a319528f-25f4-456a-af80-3c50ea86c807.png">


#### 3. Core Layer 

##### 3.1 - Materialization 1 - `view` 

* 2 `dim` Models created

<img width="989" alt="image" src="https://user-images.githubusercontent.com/64668691/194975779-51f0cc7a-b427-481c-9261-bb6d076b77c3.png">
<img width="523" alt="image" src="https://user-images.githubusercontent.com/64668691/194975883-0842c927-106c-4cda-b6f8-bc4d146ec29b.png">

##### 3.2 - Materialization 2 - `Table` / `Incremental` / `Ephemeral` 

* Create `fact` models

![image](https://user-images.githubusercontent.com/64668691/198157929-4824e833-bb48-4ad7-970e-afd1df30bbb6.png)

Updated Materialization:
* `src` models - `ephemeral` (`CTEs`) 
* `dim` models - `dim_listings_w_hosts`: `table`; the other `dim` models - `view` 
* `fct` models - `incremental` (`table appends`) 

![image](https://user-images.githubusercontent.com/64668691/198158601-ba43839b-c6a3-42eb-8672-e2c08da1bbe0.png)

##### 3.3 - Materialization 3 - `Seeds` 

* Upload a CSV `seed` file to Snowflake by running `dbt seed` 
* Create a mart model `mart_fullmoon_reviews`

![image](https://user-images.githubusercontent.com/64668691/198160788-0762c81b-d77c-4645-8cc6-52c541eecab1.png)

