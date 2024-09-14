
 USE ROLE useradmin;

CREATE ROLE IF NOT EXISTS T_E_streamlit_role;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE DEV_WH TO ROLE T_E_streamlit_role;
GRANT USAGE ON DATABASE ENGINEER_ADS TO ROLE T_E_streamlit_role;
GRANT USAGE ON SCHEMA engineer_ads.marts TO ROLE T_E_streamlit_role;

GRANT SELECT ON ALL TABLES IN SCHEMA ENGINEER_ADS.MARTS TO ROLE T_E_streamlit_ROLE;
GRANT SELECT ON ALL views IN SCHEMA ENGINEER_ADS.MARTS TO ROLE T_E_streamlit_ROLE;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ENGINEER_ADS.MARTS TO ROLE T_E_streamlit_ROLE;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA ENGINEER_ADS.MARTS TO ROLE T_E_streamlit_ROLE;

GRANT ROLE T_E_streamlit_ROLE to user T_E_streamlit;
GRANT ROLE T_E_streamlit_role TO USER ricky_user;
GRANT ROLE T_E_streamlit_role TO USER rajneet_user;
GRANT ROLE T_E_streamlit_role TO USER kristoffer_user;

GRANT ROLE T_E_streamlit_role TO USER jassef;

show grants to role t_e_streamlit_role;
--show future grants to role t_e_streamlit_role;