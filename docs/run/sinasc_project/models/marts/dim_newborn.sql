
  
    
        create or replace table `databricks_aws`.`triggo_marts`.`dim_newborn`
      
      
  using delta
      
      
      
      
      
      
      
      as
      -- models/marts/dim_newborn.sql



select 
    ID as NEWBORN_ID
    , SEX
    , RACE_NEWBORN
    , APGAR1
    , APGAR5
    , ANOMALY
    , NEWBORN_PRESENTATION
    , BIRTH_PLACE
    , BIRTH_DATE
    , BIRTH_TIME
    , BIRTH_WEIGHT
from `databricks_aws`.`triggo_intermediate`.`int_sinasc`
  