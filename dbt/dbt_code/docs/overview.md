{% docs __overview__ %}

# Team engineer project

Detta arbete är en del av kursen "Data warehouse lifecycle" på STI. 
Vi skulle söka på jobbannsonser och sedan skapa en data warehouse för att analysera annsonser med ingenjörsrelaterade(t.ex. högskoleingenjör, civilingenjör) jobbannsoner.

## Datakällor
- Arbetsförmedlingen

## Dimensions modellera
![dimensional model](assets/team_engineer_job_ads_dimension_model.png)

## Data Warehouse
- Data warehouse är skapat i Snowflake
- Data modellering är gjord i dbt
- Data pipeline är skapat i dlt

## dbt
- dbt är ett verktyg för att modellera data
- dbt används för att modellera data i data warehouse

## dlt
- dlt är ett verktyg för att skapa data pipeline
- dlt används för att skapa data pipeline i data warehouse

## Katalogstruktur

- 'models/': Innehåller alla dbt-modeller.
- 'macros/': Innehåller alla dbt-makron.
- 'analyses/': Innehåller analysfiler.
- 'logs/': Innehåller loggfiler.

## Komma igång

För att köra dbt-projektet, använd följande kommandon:

``` sh
dbt run
dbt test
dbt docs generate
dbt docs serve
``` 

{% enddocs %}
