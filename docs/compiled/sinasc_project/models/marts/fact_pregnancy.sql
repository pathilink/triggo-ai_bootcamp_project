-- models/marts/fact_pregnancy.sql



select 
    i.ID as PREGNANCY_ID
    , n.NEWBORN_ID
    , i.WEEKS_OF_PREGNANCY
    , i.TYPE_OF_PREGNANCY
    , i.TYPE_OF_DELIVERY
    , i.PRENATAL_CONSULTATIONS
    , i.PREGNANCY_WEEKS
    , i.INDUCED_LABOR
    , i.CESAREAN_BEFORE_LABOR_BEGINS
    , i.ROBSON_CLASSIFICATION
from `databricks_aws`.`triggo_intermediate`.`int_sinasc` i 
left join `databricks_aws`.`triggo_marts`.`dim_newborn` n
    on i.ID = n.NEWBORN_ID