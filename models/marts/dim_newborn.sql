-- models/marts/dim_newborn.sql

{{ config(
    materialized='table',
    schema='marts'
) }}

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
from {{ ref('int_sinasc') }}