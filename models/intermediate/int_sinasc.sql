-- models/intermediate/int_sinasc.sql
{{ config(
    materialized='view',
    schema='intermediate'
) }}

select
md5(concat(cast(CONTADOR as string), cast(STATE as string), cast(YEAR as string))) as ID
-- ORIGEM unique
-- , CODESTAB 
-- , CODMUNNASC 
, case 
    when try_cast(LOCNASC as int) = 1 then 'hospital'
    when try_cast(LOCNASC as int) = 2 then 'other health facilities'
    when try_cast(LOCNASC as int) = 3 then 'home'
    when try_cast(LOCNASC as int) = 4 then 'other'
    when try_cast(LOCNASC as int) = 5 then 'indigenous village'
    when try_cast(LOCNASC as int) = 9 then 'unknown'
    end as BIRTH_PLACE
, IDADEMAE as AGE_MOTHER
, case 
    when try_cast(IDADEMAE as int) between 5 and 9 then '5-9'
    when try_cast(IDADEMAE as int) between 10 and 14 then '10-14'
    when try_cast(IDADEMAE as int) between 15 and 19 then '15-19'
    when try_cast(IDADEMAE as int) between 20 and 24 then '20-24'
    when try_cast(IDADEMAE as int) between 25 and 29 then '25-29'
    when try_cast(IDADEMAE as int) between 30 and 34 then '30-34'
    when try_cast(IDADEMAE as int) between 35 and 39 then '35-39'
    when try_cast(IDADEMAE as int) between 40 and 44 then '40-44'
    when try_cast(IDADEMAE as int) >= 45 then '45+'
    else 'unknown'
    end as AGE_RANGE_MOTHER
, case 
    when try_cast(ESTCIVMAE as int) = 1 then 'single'
    when try_cast(ESTCIVMAE as int) = 2 then 'married'
    when try_cast(ESTCIVMAE as int) = 3 then 'widowed'
    when try_cast(ESTCIVMAE as int) = 4 then 'divorced'
    when try_cast(ESTCIVMAE as int) = 5 then 'common-law marriage'
    when try_cast(ESTCIVMAE as int) = 9 then 'unknown'
    end as MARITAL_STATUS_MOTHER
, case 
    when try_cast(ESCMAE as int) = 1 then 'none'
    when try_cast(ESCMAE as int) = 2 then '1-3'
    when try_cast(ESCMAE as int) = 3 then '4-7'
    when try_cast(ESCMAE as int) = 4 then '8-11'
    when try_cast(ESCMAE as int) = 5 then '>=12'
    when try_cast(ESCMAE as int) = 9 then 'unknown'
    end as YEARS_STUDY_MOTHER
-- , CODOCUPMAE as OCCUPATION_CODE_MOTHER 
, QTDFILVIVO as LIVING_CHILDREN 
, QTDFILMORT as FETAL_LOSSES
-- , CODMUNRES 
, case
    when try_cast(GESTACAO as int) = 1 then '<22'
    when try_cast(GESTACAO as int) = 2 then '22-27'
    when try_cast(GESTACAO as int) = 3 then '28-31'
    when try_cast(GESTACAO as int) = 4 then '32-36'
    when try_cast(GESTACAO as int) = 5 then '37-41'
    when try_cast(GESTACAO as int) = 6 then '>=42'
    when try_cast(GESTACAO as int) = 9 then 'unknown'
    end as WEEKS_OF_PREGNANCY 
, case
    when try_cast(GRAVIDEZ as int) = 1 then 'single'
    when try_cast(GRAVIDEZ as int) = 2 then 'twin'
    when try_cast(GRAVIDEZ as int) = 3 then 'triplet or more'
    when try_cast(GRAVIDEZ as int) = 9 then 'unknown'
    end as TYPE_OF_PREGNANCY 
, case 
    when try_cast(PARTO as int) = 1 then 'vaginal'
    when try_cast(PARTO as int) = 2 then 'cesarean'
    when try_cast(PARTO as int) = 9 then 'unknown'
    end as TYPE_OF_DELIVERY 
, case  
    when try_cast(CONSULTAS as int) = 1 then 'none'
    when try_cast(CONSULTAS as int) = 2 then '1-3'
    when try_cast(CONSULTAS as int) = 3 then '4-6'
    when try_cast(CONSULTAS as int) = 4 then '>=7'
    when try_cast(CONSULTAS as int) = 9 then 'ignored' 
    end as PRENATAL_CONSULTATIONS_RANGE
, to_date(nullif(try_cast(DTNASC as string), ''), 'ddMMyyyy') as BIRTH_DATE  
, date_format(
    to_timestamp(lpad(cast(HORANASC as string), 4, '0'), 'HHmm'),
    'HH:mm'
    ) as BIRTH_TIME
, case 
    when try_cast(SEXO as int) = 1 then 'male'
    when try_cast(SEXO as int) = 2 then 'female'
    when try_cast(SEXO as int) = 0 then 'unknown'
    end as SEX  
, APGAR1 
, APGAR5 
, case 
    when try_cast(RACACOR as int) = 1 then 'white'
    when try_cast(RACACOR as int) = 2 then 'black'
    when try_cast(RACACOR as int) = 3 then 'yellow'
    when try_cast(RACACOR as int) = 4 then 'brown'
    when try_cast(RACACOR as int) = 5 then 'indigenous'
    end as RACE_NEWBORN 
, PESO as BIRTH_WEIGHT
, case
    when try_cast(IDANOMAL as int) = 1 then 'yes'
    when try_cast(IDANOMAL as int) = 2 then 'no'
    when try_cast(IDANOMAL as int) = 9 then 'ignored'
    end as ANOMALY
, to_date(nullif(try_cast(DTCADASTRO as string), ''), 'ddMMyyyy') as REGISTRATION_DATE  
-- , CODANOMAL null 
-- , NUMEROLOTE nn
-- , VERSAOSIST nn
-- , DTRECEBIM nn
-- , DIFDATA nn 
-- , DTRECORIGA null
-- , NATURALMAE nn
-- , CODMUNNATU nn
-- , CODUFNATU 
, case
    when try_cast(ESCMAE2010 as int) = 0 then 'no schooling'
    when try_cast(ESCMAE2010 as int) = 1 then 'elementary school (1st to 4th grade)'
    when try_cast(ESCMAE2010 as int) = 2 then 'middle school (5th to 8th grade)'
    when try_cast(ESCMAE2010 as int) = 3 then 'high school (former 2nd Grade)' 
    when try_cast(ESCMAE2010 as int) = 4 then 'incomplete higher education' 
    when try_cast(ESCMAE2010 as int) = 5 then 'complete higher education'
    when try_cast(ESCMAE2010 as int) = 9 then 'unknown' 
    end as EDUCATION_MOTHER
-- , SERIESCMAE 
, to_date(nullif(try_cast(DTNASCMAE as string), ''), 'ddMMyyyy') as BIRTH_MOTHER_DATE  
, case 
    when try_cast(RACACORMAE as int) = 1 then 'white'
    when try_cast(RACACORMAE as int) = 2 then 'black'
    when try_cast(RACACORMAE as int) = 3 then 'yellow'
    when try_cast(RACACORMAE as int) = 4 then 'brown'
    when try_cast(RACACORMAE as int) = 5 then 'indigenous'
    end as RACE_MOTHER 
, QTDGESTANT as PREVIOUS_PREGNANCIES 
, QTDPARTNOR as VAGINAL_BIRTHS
, QTDPARTCES as CESAREAN_BIRTHS
, IDADEPAI as AGE_FATHER
, to_date(nullif(try_cast(DTULTMENST as string), ''), 'ddMMyyyy') as LAST_MENSTRUATION_DATE  
, SEMAGESTAC as PREGNANCY_WEEKS 
-- , TPMETESTIM 
, CONSPRENAT as PRENATAL_CONSULTATIONS 
, MESPRENAT as PRENATAL_CARE_MONTH
, case
    when try_cast(TPAPRESENT as int) = 1 then 'cephalic'
    when try_cast(TPAPRESENT as int) = 2 then 'pelvic or breech'
    when try_cast(TPAPRESENT as int) = 3 then 'transverse'
    when try_cast(TPAPRESENT as int) = 9 then 'unknown' 
    end as NEWBORN_PRESENTATION
, case
    when try_cast(STTRABPART as int) = 1 then 'yes'
    when try_cast(STTRABPART as int) = 2 then 'no'
    when try_cast(STTRABPART as int) = 3 then 'not applicable'
    when try_cast(STTRABPART as int) = 9 then 'unknown'
    end as INDUCED_LABOR 
, case
    when try_cast(STCESPARTO as int) = 1 then 'yes'
    when try_cast(STCESPARTO as int) = 2 then 'no'
    when try_cast(STCESPARTO as int) = 3 then 'not applicable'
    when try_cast(STCESPARTO as int) = 9 then 'unknown'
    end as CESAREAN_BEFORE_LABOR_BEGINS 
, case 
    when try_cast(TPNASCASSI as int) = 1 then 'physician'
    when try_cast(TPNASCASSI as int) = 2 then 'nurse or midwife'
    when try_cast(TPNASCASSI as int) = 3 then 'midwife'
    when try_cast(TPNASCASSI as int) = 4 then 'other'
    when try_cast(TPNASCASSI as int) = 9 then 'unknown'
    end as BIRTH_ASSISTED
-- , TPFUNCRESP 
-- , TPDOCRESP 
-- , DTDECLARAC nn
-- , ESCMAEAGR1 
-- , STDNEPIDEM unique
-- , STDNNOVA unique
-- , CODPAISRES unique 
, TPROBSON as ROBSON_CLASSIFICATION
, case
    when try_cast(PARIDADE as int) = 1 then 'multipara'
    when try_cast(PARIDADE as int) = 0 then 'nullipara'
    end as PREVIOUS_GESTATIONS
, KOTELCHUCK 
, CONTADOR as COUNTER
, STATE 
, YEAR
from {{ ref('stg_sinasc') }} 
