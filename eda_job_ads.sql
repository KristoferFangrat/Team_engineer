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
