USE ROLE SYSADMIN;
USE DATABASE ENGINEER_ADS;
USE SCHEMA ENGINEER_ADS.STAGING;
USE WAREHOUSE DEV_WH;

USE ROLE USERADMIN;

SHOW ROLES;
USE ROLE T_E_DLT_ROLE;

SELECT 
    EMPLOYER__ORGANIZATION_NUMBER,
    EMPLOYER__NAME,

FROM 
    engineer_field_job_ads 
LIMIT 100;

SELECT
    ID,
    EMPLOYER__NAME,
    DESCRIPTION__TEXT,
    OCCUPATION_GROUP__LABEL
FROM 
    engineer_field_job_ads;

SELECT
    DISTINCT(OCCUPATION__LABEL)
FROM
    engineer_field_job_ads;

SELECT
    DISTINCT(SOURCE_TYPE)
FROM
    engineer_field_job_ads;

SELECT
    HEADLINE,
    _DLT_LOAD_ID
FROM
    engineer_field_job_ads
LIMIT 200;

SELECT
    HEADLINE,
    occupation__label,
    _DLT_LOAD_ID
FROM
    engineer_field_job_ads
    WHERE _DLT_LOAD_ID = '1725637528.460333'
LIMIT 200;

SELECT employer__name, WORKPLACE_ADDRESS__STREET_ADDRESS FROM ENGINEER_FIELD_JOB_ADS WHERE employer__name = UPPER(employer__name) LIMIT 100;

SELECT employer__name FROM ENGINEER_FIELD_JOB_ADS WHERE employer__name IS NULL LIMIT 100;
SELECT employer__name, employer__organization_number FROM ENGINEER_FIELD_JOB_ADS WHERE employer__organization_number = NULL LIMIT 100;

SELECT employer__name, workplace_address__region FROM ENGINEER_FIELD_JOB_ADS WHERE workplace_address__region IS null LIMIT 100;

SELECT employer__name, workplace_address__region FROM ENGINEER_FIELD_JOB_ADS WHERE workplace_address__region = UPPER(workplace_address__region) LIMIT 100;


SELECT employer__name, workplace_address__postcode FROM ENGINEER_FIELD_JOB_ADS WHERE workplace_address__postcode IS null LIMIT 100;


SELECT employer__name, workplace_address__postcode FROM ENGINEER_FIELD_JOB_ADS LIMIT 200;

SELECT DISTINCT(workplace_address__country) FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(workplace_address__city) FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(workplace_address__country) FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(workplace_address__municipality) FROM ENGINEER_FIELD_JOB_ADS;

SELECT workplace_address__municipality  FROM ENGINEER_FIELD_JOB_ADS WHERE workplace_address__municipality IS NULL;

SELECT headline
FROM ENGINEER_FIELD_JOB_ADS
WHERE headline IS NULL;

SELECT headline
FROM ENGINEER_FIELD_JOB_ADS
WHERE HEADLINE = UPPER(HEADLINE);

SELECT description__text
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 10;


SELECT description__text
FROM ENGINEER_FIELD_JOB_ADS
WHERE description__text IS NULL
LIMIT 10;

SELECT DISTINCT(employment_type__label)
FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(employment_type__label)
FROM ENGINEER_FIELD_JOB_ADS
WHERE employment_type__label IS NULL;

SELECT DISTINCT(SALARY_TYPE__LABEL)
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 50;


SELECT DISTINCT(SCOPE_OF_WORK__MIN)
FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(SCOPE_OF_WORK__MAX)
FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(OCCUPATION_GROUP__LABEL)
FROM ENGINEER_FIELD_JOB_ADS;

SELECT DISTINCT(OCCUPATION_GROUP__LABEL)
FROM ENGINEER_FIELD_JOB_ADS
WHERE occupation_group__label IS NULL;


SELECT description__text
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 5;

SELECT
    EMPLOYMENT_TYPE__LABEL
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 10;

SELECT DISTINCT(DURATION__LABEL)
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 5;

SELECT OCCUPATION_GROUP__LABEL
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 10;

SELECT DISTINCT(OCCUPATION_FIELD__LABEL)
FROM ENGINEER_FIELD_JOB_ADS
LIMIT 20;


SELECT employer_id, COUNT(*)
FROM dim_employer
GROUP BY employer_id
HAVING COUNT(*) > 1;

SELECT id, COUNT(*)
FROM engineer_field_job_ads
GROUP BY id
HAVING COUNT(*) > 1;

SELECT headline
FROM dim_job_detail
WHERE HEADLINE = UPPER(HEADLINE);


SELECT DISTINCT(workplace_region)
FROM dim_employer;

SELECT DISTINCT(workplace_city)
FROM dim_employer;
SELECT DISTINCT(workplace_country)
FROM dim_employer;


SELECT DISTINCT(duration)
FROM dim_job_detail;


SELECT DISTINCT(scope_of_work_min)
FROM dim_job_detail;


SELECT DISTINCT(scope_of_work_max)
FROM dim_job_detail;


SELECT * 
FROM dim_auxillary_atribute
LIMIT 10;

SELECT distinct(number_of_vacancies)
FROM engineer_field_job_ads;