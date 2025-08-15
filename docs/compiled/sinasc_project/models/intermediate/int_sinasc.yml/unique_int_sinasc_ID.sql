
    
    

select
    ID as unique_field,
    count(*) as n_records

from `databricks_aws`.`triggo_intermediate`.`int_sinasc`
where ID is not null
group by ID
having count(*) > 1


