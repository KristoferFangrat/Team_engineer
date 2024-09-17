{% docs __overview__ %}

# Team Engineer Projekt

Detta arbete är en del av kursen "Data Warehouse Lifecycle" på STI. 
Vi skulle söka på jobbannonser och sedan skapa ett data warehouse för att analysera annonser med ingenjörsrelaterade (t.ex. högskoleingenjör, civilingenjör) jobbannonser.

## Datakällor
- [Arbetsförmedlingen](https://www.arbetsformedlingen.se): Den primära källan för jobbannonser.

## Dimensions-modell
Denna modell visar en överblick över vår dimensionsmodellering.

![dimensional model](assets/team_engineer_job_ads.png)

## Data Warehouse
- Data warehouse är skapat i Snowflake.
- Data modellering är gjord i dbt.
- Data pipeline är skapad i dlt.

## dbt
- dbt (data build tool) är ett verktyg för att modellera data.
- dbt används för att transformera data i data warehouse.
- dbt möjliggör versionering och testning av datamodeller.

## dlt
- dlt (data loading tool) är ett verktyg för att skapa data pipelines.
- dlt används för att extrahera, transformera och ladda data till data warehouse.
- dlt säkerställer att data pipelines är robusta och skalbara.

## Katalogstruktur

- `models/`: Innehåller alla dbt-modeller.
- `macros/`: Innehåller alla dbt-makron.
- `analyses/`: Innehåller analysfiler.
- `logs/`: Innehåller loggfiler.

## Komma igång

För att köra igång projektet, följ dessa steg.

### Initial setup

* Skapa en virtuell miljö. Installera requirements.txt.

* Logga in på snowflake via extension Snowflake i VS-code. Se till att du har en warehouse som heter dev_wh eller byt namn i projektets konfiguration.

* Kör filen setup_db.sql i snowflake_worksheets.

* Kör filerna setup_dbt_role.sql, setup_dlt_role.sql, och setup_streamlit_role.sql.

* Skapa en användare. Förslagsvis snowflake_worksheets/setup_user.sql fil som du också lägger in i gitignore.

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

* Kör scriptet jobsearch_engineer.

* Kolla gärna att det funkat genom att köra snowflake_worksheets/check_loaded_data.sql. Håll denna flik öppen till senare.

* Kör scriptet snowflake_worksheets/clean_up_staging.sql för att ta bort dubletter.

### DBT

* Kör open ~/.dbt/profiles.yml i terminalen och se till att det står på detta sättet.

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

* Kör cd "dbt/dbt_code" i terminalen. Kör sedan "dbt debug" för att se till att allt stämmer. Om det funkar som det ska, kör "dbt deps" för att installera dependencies.

* Slutligen, kör "dbt run" i terminalen för att köra dbt.

### 


För att köra dbt-projektet, använd följande kommandon:

```sh
dbt deps
dbt run
dbt test
dbt docs generate
dbt docs serve
```

{% enddocs %}