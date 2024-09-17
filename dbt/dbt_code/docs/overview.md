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

## DLT (Data loading tool)
- dlt (data loading tool) är ett verktyg för att skapa data pipelines.
- dlt används för att extrahera, transformera och ladda data till data warehouse.
- dlt säkerställer att data pipelines är robusta och skalbara.

## DBT (Data build tool)
- DBT är ett kraftfullt verktyg för __datatransformation__ inom en __datapipeline__. Det låter analytiker och ingenjörer att omvandla rådata till användbara insikter med hjälp av SQL.
- Viktiga koncept för DBT:
    - En __modell__ i dbt är helt enkelt en __SQL-fil__ där du skriver transformationer. Varje modell motsvarar en tabell eller en ny i din databas.
    - __Inkrementell modell__ låter dig bearbeta ny eller ändrad data istället för bearbeta hela datasetet varje gång.
- __Jinja__
    - Dbt använder __Jinja__, ett template språk, som gör det möjligt att skapa dynamiska SQL. Detta hjälper att SQL-frågor mer flexibla och återanvändbara, exempelvis genom att parametrar eller makron.
- __Källor__
    - En källa i dbt refererar till rådatatabeller som du hämtar från andra system (t.ex dina staging-data). Du definierar dem i `schema.sql`-filer och använder dem i modeller för transformation.
- __Tester__
    - Dbt låter dig göra __tester__ på din data för att säkerställa datakvaliteten. Detta inkluderar både __inbyggda tester__ som `not_null` eller `unique` och __anpassade tester__ för att upprätthålla affärsregler.
- __Dokumentation__
    - Dbt generar __dokumentation__ för dina modeller och källor, vilket gör det lätt att förstå och förklara din datapipeline. Detta inkluderar beskrivningar, beroenden och datahärledning.

## Streamlit
- Streamlit är ett Python bibliotek som låter dig att snabbt bygga och dela webbapplikationer.
- Streamlit har inbyggda komponenter som knappar, sliders och inmatningsfält, vilket leder till att enkelt skapa interaktiva applikationer.
- Streamlit-appar är interaktiva till sin natur.
- Streamlit stöder olika datavisualiseringar, inklusive linjediagram, stapeldiagram och kartor.
- Bibliotek som Matplotlib, Plotly och Altair interageras enkelt med Streamlit för att skapa kraftfulla dynamiska visualiseringar.
- __Streamlit-appar__ kan distribueras till webben med Streamlit Cloud eller hostas på olika plattformar, vilket gör det enkelt att dela dataapplikationer utan att behöva komplexa distributionspipelines.
- Streamlit interageras sömnlöst med __Pandas__, vilket låter dig manipulera och visualisera data direkt från __dataframes__. Det fungerar också bra med __SQL-databaser__, __API__ och andra data källor.

## Katalogstruktur

- `models/`: Innehåller alla dbt-modeller.
- `macros/`: Innehåller alla dbt-makron.
- `analyses/`: Innehåller analysfiler.
- `logs/`: Innehåller loggfiler.

## Kontakta

För frågor eller support, kontakta Yohanna.

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

{% enddocs %}