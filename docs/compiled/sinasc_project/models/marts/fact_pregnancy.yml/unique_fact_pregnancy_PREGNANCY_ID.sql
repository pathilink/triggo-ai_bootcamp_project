
    
    

select
    PREGNANCY_ID as unique_field,
    count(*) as n_records

from `databricks_aws`.`triggo_marts`.`fact_pregnancy`
where PREGNANCY_ID is not null
group by PREGNANCY_ID
having count(*) > 1


