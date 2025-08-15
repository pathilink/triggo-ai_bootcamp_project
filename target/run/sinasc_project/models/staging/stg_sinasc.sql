
  
    
        create or replace table `databricks_aws`.`triggo_staging`.`stg_sinasc`
      
      
  using delta
      
      
      
      
      
      
      
      as
      -- models/staging/stg_sinasc.sql



    select * from `databricks_aws`.`triggo`.`norte_2020_raw`
    union all
    select * from `databricks_aws`.`triggo`.`norte_2021_raw`
    union all
    select * from `databricks_aws`.`triggo`.`norte_2022_raw`
    union all
    select * from `databricks_aws`.`triggo`.`nordeste_2020_raw`
    union all
    select * from `databricks_aws`.`triggo`.`nordeste_2021_raw`
    union all
    select * from `databricks_aws`.`triggo`.`nordeste_2022_raw`
    union all
    select * from `databricks_aws`.`triggo`.`centro_oeste_2020_raw`
    union all
    select * from `databricks_aws`.`triggo`.`centro_oeste_2021_raw`
    union all
    select * from `databricks_aws`.`triggo`.`centro_oeste_2022_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sudeste_2020_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sudeste_2021_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sudeste_2022_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sul_2020_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sul_2021_raw`
    union all
    select * from `databricks_aws`.`triggo`.`sul_2022_raw`
  