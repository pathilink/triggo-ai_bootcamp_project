
    
    

select
    NEWBORN_ID as unique_field,
    count(*) as n_records

from `databricks_aws`.`triggo_marts`.`dim_newborn`
where NEWBORN_ID is not null
group by NEWBORN_ID
having count(*) > 1


