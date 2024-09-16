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

För att köra dbt-projektet, använd följande kommandon:

```sh
dbt deps
dbt run
dbt test
dbt docs generate
dbt docs serve
```

# Makro-dokumentation

## `generate_schema_name`

### Beskrivning

Makrot `generate_schema_name` genererar ett schemanamn baserat på det angivna `custom_schema_name` och standardschemat från målkonfigurationen.

### Parametrar

- `custom_schema_name` (string): Det anpassade schemanamnet att använda. Om `None` används standardschemat från målkonfigurationen.
- `node` (dict): Nodordboken som innehåller information om den aktuella modellen, seed eller ögonblicksbilden. Denna parameter skickas vanligtvis automatiskt av dbt.

{% enddocs %}