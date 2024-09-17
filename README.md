## Komma igång

För att köra igång projektet, följ dessa steg.

### Initial setup

* Skapa en virtuell miljö. Installera requirements.txt.

* Logga in på snowflake via extension Snowflake i VS-code. Se till att du har en warehouse som heter dev_wh eller byt namn i projektets konfiguration.

* Kör filen setup_db.sql i snowflake_worksheets.

* Kör filerna setup_dbt_role.sql, setup_dlt_role.sql, och setup_streamlit_role.sql.

* Skapa en användare. Förslagsvis snowflake_worksheets/setup_user.sql fil som du också lägger in i gitignore:

USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS <ditt användarnamn>
    PASSWORD = <ditt lösenord>
    DEFAULT_WAREHOUSE = dev_wh;

* Kör sedan kommandon för att ge dig själv privilegiumen som behövs för att använda programmet:

GRANT ROLE T_E_DBT_ROLE TO USER <ditt användarnamn>;
GRANT ROLE T_E_DLT_ROLE TO USER <ditt användarnamn>;
GRANT ROLE T_E_streamlit_ROLE TO USER <ditt användarnamn>;

* Skapa även en fil under .dlt som heter secrets.toml med detta format:

[destination.snowflake.credentials]
database = "ENGINEER_ADS"
password = <"ditt lösenord">
username = <"ditt användarnamn">
host = <"din account location url">
warehouse = "DEV_WH" 
role = "T_E_DLT_ROLE"

### DLT

* Byt till t_e_dlt_role.

* Kör scriptet jobsearch_engineer.

* Kolla gärna att det funkat genom att köra snowflake_worksheets/check_loaded_data.sql. Håll denna flik öppen till senare.

* Kör scriptet snowflake_worksheets/clean_up_staging.sql för att ta bort dubletter.

### DBT

* Byt till t_e_dbt_role.

* Kör open ~/.dbt/profiles.yml i terminalen och se till att det står på detta sättet:

dbt_code:
  outputs:
    dev:
      account: <"din account location url">
      database: engineer_ads
      password: <"ditt lösenord">
      role: T_E_DBT_role
      schema: warehouse
      threads: 1
      type: snowflake
      user: <"ditt användarnamn">
      warehouse: dev_wh
  target: dev

* Ta reda på _dlt_load_id för alla olika queries du kört genom resultatet i snowflake_worksheets/check_loaded_data.sql och ändra sedan variablerna i dbt/dbt_code/models/dim/dim_job_detail/dim_job_detail.sql så att titlarna överensstämmer med _dlt_load_id. 

* Kör "cd dbt/dbt_code" i terminalen. Kör sedan "dbt debug" för att se till att allt stämmer. Om det funkar som det ska, kör "dbt deps" för att installera dependencies.

* Skriv "dbt run" i terminalen för att köra dbt.

* För att säkerställa att allting funkar som det ska, skriv "dbt test" i terminalen och felsök eventuella fel.

### Streamlit

* Byt till t_e_Streamlit_role.

* Öppna mappen dashboard_streamlit. Skapa en .env-fil i denna mapp med följande format:
SNOWFLAKE_USER=<"ditt användarnamn">
SNOWFLAKE_PASSWORD=<"ditt lösernord">
SNOWFLAKE_ACCOUNT=<"din account location url">
SNOWFLAKE_WAREHOUSE=DEV_WH
SNOWFLAKE_DATABASE=Engineer_ads
SNOWFLAKE_SCHEMA=Marts
SNOWFLAKE_ROLE=T_E_Streamlit_role

* Kör scriptet dashboard_streamlit/streamlit_worksheets/run_dashboard

* Klar! Dashboarden öppnas i ett separat fönster och är redo att användas.


## Dokumentation

För all information om projektet, kör dessa kommandon i terminalen:

* cd dbt/dbt_code
* dbt docs generate
* dbt docs serve
