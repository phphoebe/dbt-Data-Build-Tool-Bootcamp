Happy Modeling! 

## [The Complete dbt (Data Build Tool) Bootcamp: Zero to Hero](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/) | Udemy

Instructors: Zoltan C. Toth & Miklos (Mike) Petridisz

## Part 1 - Theory
* ETL & ELT
* Data Warehouses, Data Lakes and Lakehouses 
* The Modern Data Stack
* Slowly Changing Dimension (SCD)
  * Type 0 - Retain Original
  * Type 1 - Overwrite
  * Type 2 - Add New Row
  * Type 3 - Add New Attribute
  

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

### 1. dbt-core setup

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

### 2. Staging Layer - Source Models created


<img width="954" alt="image" src="https://user-images.githubusercontent.com/64668691/194973414-bbea6191-3b15-4cd7-8415-d0048983d28e.png">

<img width="1441" alt="image" src="https://user-images.githubusercontent.com/64668691/194973649-a319528f-25f4-456a-af80-3c50ea86c807.png">


### 3. Core Layer 

#### 3.1 - Materialization 1 - `view` 

* Two `dim` Models created

<img width="989" alt="image" src="https://user-images.githubusercontent.com/64668691/194975779-51f0cc7a-b427-481c-9261-bb6d076b77c3.png">
<img width="523" alt="image" src="https://user-images.githubusercontent.com/64668691/194975883-0842c927-106c-4cda-b6f8-bc4d146ec29b.png">

#### 3.2 - Materialization 2 - `Table` / `Incremental` / `Ephemeral` 

* Create `fact` models

![image](https://user-images.githubusercontent.com/64668691/198157929-4824e833-bb48-4ad7-970e-afd1df30bbb6.png)

Updated Materialization:
* `src` models - `ephemeral` (`CTEs`) 
* `dim` models - `dim_listings_w_hosts`: `table`; the other `dim` models - `view` 
* `fct` models - `incremental` (`table appends`) 

![image](https://user-images.githubusercontent.com/64668691/198158601-ba43839b-c6a3-42eb-8672-e2c08da1bbe0.png)

### 4 - `Seeds` and `Sources`

#### 4.1 - `Seeds` 

* Upload a CSV `seed` file to Snowflake by running `dbt seed` 
* Create a mart model `mart_fullmoon_reviews`

![image](https://user-images.githubusercontent.com/64668691/198160788-0762c81b-d77c-4645-8cc6-52c541eecab1.png)

#### 4.2 - `Sources` 

* Add `sources.yml` file in the `models` folder
* Implement the `source` function in the Staging layer `src` models 
* `dbt compile`

![image](https://user-images.githubusercontent.com/64668691/198161767-3e29fb74-b983-4ccb-a126-78ba968c06e4.png)

* Check source freshness by running `dbt source freshness`

![image](https://user-images.githubusercontent.com/64668691/198162761-65356f31-8964-4c97-81d0-b6b36bbcf35a.png)


### 5 - `Snapshots` 

![image](https://user-images.githubusercontent.com/64668691/198850312-713a25f5-7cbb-4d65-9f07-0b1a23ba751e.png)

* command: `dbt snapshot` 

![image](https://user-images.githubusercontent.com/64668691/198850924-c99e411e-39cb-48e6-a296-649d0fd69245.png)

![image](https://user-images.githubusercontent.com/64668691/198850957-5af72001-6900-43e5-8865-82e2cd40c0a6.png)

Update 1 record in `raw_listings` and then re-execute `dbt snapshot` 

![image](https://user-images.githubusercontent.com/64668691/198852940-d1ac0647-1a5e-433c-96d1-e2b80fb1ba57.png)


### 6 - `Tests` 



### 7 - `Macros`, `Custom Tests` and `Packages`


### 8 - `Documentation`


### 9 - `Analyses`, `Hooks` and `Exposures`
