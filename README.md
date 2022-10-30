Happy Modeling! 

## [The Complete dbt (Data Build Tool) Bootcamp: Zero to Hero](https://www.udemy.com/course/complete-dbt-data-build-tool-bootcamp-zero-to-hero-learn-dbt/) | Udemy

Instructors: Zoltan C. Toth & Miklos (Mike) Petridisz

# Part 1 - Theory
* ETL & ELT
* Data Warehouses, Data Lakes and Lakehouses 
* The Modern Data Stack
* Slowly Changing Dimension (SCD)
  * Type 0 - Retain Original
  * Type 1 - Overwrite
  * Type 2 - Add New Row
  * Type 3 - Add New Attribute
  

# Part 2 - Practice

* dbt-core Setup
* Models 
* Materializations
* Seeds and Sources 
* Snapshots
* Tests
* Macros, Custom Tests and Packages 
* Documentation 
* Analyses, Hooks and Exposures 
* Debugging Tests and Testing with `dbt-expectations`

# Project Progress

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

* **Singular** 
  * `SQL Queries` stored in the `tests` folder - expected to return an empty result set
* **Generic** - *built-in tests in dbt:*
  * `unique`
  * `not_null`
  * `accepted_values`
  * `relationships`
 
* command: `dbt test`
* `dbt test --help` - get docs of useful commands 

![image](https://user-images.githubusercontent.com/64668691/198854155-e10581ab-d7f4-403a-966d-76f7fc6a4d55.png)



### 7 - `Macros`, `Custom Tests` and `Packages`

#### 7.1 - Use Macros in tests
* Macro: `no_nulls_in_columns.sql` in the `macros` folder
* Test: `no_nulls_in_dim_listings.sql` in the `tests` folder 
* run `dbt test --select dim_listings_cleansed`


#### 7.2 - Write Custom Generic Tests
* Create the `positvie_value` Macro
* Update the `schema` YMAL file to add in the `positive_value` test of the `minimum_nights` column
* run `dbt test --select dim_listings_cleansed`


#### 7.3 - Installing Third-Party Packages

* Head to https://hub.getdbt.com/ to find the most commonly used packages
* Practice installing `dbt_utils` 
* command: `dbt deps` 
* Use the [surrogate_key](https://github.com/phphoebe/dbt-utils#surrogate_key-source) function to generate a Primary Key (`review_id`) for a table (`fct_reviews`): 

```
{{ dbt_utils.surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} as review_id
```

* Need a Full Refresh of the Incremental model by running: `dbt run --full-refresh --select fct_reviews`
* Check in Snowflake - changes got applied: 

![image](https://user-images.githubusercontent.com/64668691/198857472-4e1018f7-1578-400a-97c0-f6e4566f75e4.png)

![image](https://user-images.githubusercontent.com/64668691/198857495-c160fc34-c363-4d38-b3ea-e1d7c247eae6.png)


### 8 - `Documentation`

Documentations in dbt can be defined in two ways:
1. In ymal files (like `schema.yml`)
2. In standalone Markdown files

#### 8.1 - Writing and Exploring Basic Documentation

* command: `dbt doc generate` 
* run `dbt docs serve` get to -:

<img width="1225" alt="image" src="https://user-images.githubusercontent.com/64668691/198859411-ad25a7cc-190d-4e63-809a-1e560dbf1e2d.png">

<img width="1511" alt="image" src="https://user-images.githubusercontent.com/64668691/198859475-7a0d4844-0707-41ee-b905-e8f49b266254.png">

#### 8.2 - Markdown-based Docs, Custom Overview Page and Assets

<img width="1133" alt="image" src="https://user-images.githubusercontent.com/64668691/198860439-a3c36a05-c60a-49b7-923e-328f6a75c420.png">


#### 8.2 - The Lineage Graph (Data Flow DAG)

`Lineage Graph` 

<img width="1193" alt="image" src="https://user-images.githubusercontent.com/64668691/198860824-3f161e3c-4eb7-4b47-b390-ceddf68bcf3e.png">



### 9 - `Analyses`, `Hooks` and `Exposures`

#### 9.1 - Analyses 

Version controlled Ad-hoc Queries - the models will not be materialized anywhere

* command: `dbt compile`
* get the compiled query by running `less target/compiled/dbtlearn/analyses/full_moon_no_sleep.sql` 
* copy and paste compiled query in Snowfalke to run 

#### 9.2 - Hooks

* SQLs that are executed at predefined times
* Can be configured at the Project, subfolder, or Model level
* Types: 
  * `on_run_start` 
  * `on_the_run_end`
  * `pre-hook`
  * `post-hook` 

#### 9.3 - Setting up a BI Dashboard in Snowflake and Preset

#### 9.4 - Exposures


### 10 - Debugging Tests and Testing with `dbt-expectations`

#### 10.1 - Compare row counts between models

* Use the [expect_table_row_count_to_equal_other_table](https://github.com/calogica/dbt-expectations#expect_table_row_count_to_equal_other_table) function to create a test for the `dim_listings_w_hosts` model
* command `dbt test --select dim_listings_w_hosts`
