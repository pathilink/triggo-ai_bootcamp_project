-- models/staging/stg_sinasc.sql

{{ config(
    materialized='table',
    schema='staging'
) }}

    select * from {{ source('sinasc', 'norte_2020_raw') }}
    union all
    select * from {{ source('sinasc', 'norte_2021_raw') }}
    union all
    select * from {{ source('sinasc', 'norte_2022_raw') }}
    union all
    select * from {{ source('sinasc', 'nordeste_2020_raw') }}
    union all
    select * from {{ source('sinasc', 'nordeste_2021_raw') }}
    union all
    select * from {{ source('sinasc', 'nordeste_2022_raw') }}
    union all
    select * from {{ source('sinasc', 'centro_oeste_2020_raw') }}
    union all
    select * from {{ source('sinasc', 'centro_oeste_2021_raw') }}
    union all
    select * from {{ source('sinasc', 'centro_oeste_2022_raw') }}
    union all
    select * from {{ source('sinasc', 'sudeste_2020_raw') }}
    union all
    select * from {{ source('sinasc', 'sudeste_2021_raw') }}
    union all
    select * from {{ source('sinasc', 'sudeste_2022_raw') }}
    union all
    select * from {{ source('sinasc', 'sul_2020_raw') }}
    union all
    select * from {{ source('sinasc', 'sul_2021_raw') }}
    union all
    select * from {{ source('sinasc', 'sul_2022_raw') }}
