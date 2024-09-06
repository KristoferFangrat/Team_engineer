USE ROLE T_E_dlt_role;

USE DATABASE ENGINEER_ADS;
USE WAREHOUSE DEV_WH;
USE SCHEMA STAGING;


SELECT * FROM engineer_field_job_ads LIMIT 5;

SELECT COUNT(*) FROM engineer_field_job_ads;

SELECT DESCRIPTION__TEXT FROM engineer_field_job_ads LIMIT 10;

SELECT OCCUPATION_GROUP__LABEL FROM engineer_field_job_ads LIMIT 10;

SELECT  DISTINCT(_dlt_load_id) FROM engineer_field_job_ads
ORDER BY _dlt_load_id;
SELECT  DISTINCT(_dlt_load_id), OCCUPATION__LABEL FROM engineer_field_job_ads
ORDER BY _dlt_load_id;

