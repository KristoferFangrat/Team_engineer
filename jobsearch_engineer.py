import dlt
import requests
import json
from pathlib import Path
import os

def _get_ads(url_for_search, params):
    headers = {"accept": "application/json"}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode("utf8"))


@dlt.resource(write_disposition="append")
def jobsearch_resource(params):

    url = "https://jobsearch.api.jobtechdev.se"
    url_for_search = f"{url}/search"

    total_fetched = 0
    while True:
        #Update offset for pagination
        params["offset"] = total_fetched

        ads = _get_ads(url_for_search, params)["hits"]

        #stop if there are no more ads
        if not ads:
            break

        for ad in ads:
            yield ad

        #Break loop if less than 100 ads are returned (last page)
        if len(ads) < 100:
            break

        #update the total fetched ads count for the next pagination step
        total_fetched += 100


def run_pipeline(query, table_name):
    pipeline = dlt.pipeline(
        pipeline_name="jobsearch_engineer",
        destination="snowflake",
        dataset_name="Staging",
    )

    params = {"q": query, "limit": 100, "offset": 0}

    load_info = pipeline.run(jobsearch_resource(params=params), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    queries = ["rymdingenjör", "driftingenjör", "automationsingenjör", "högskoleingenjör", "civilingenjör", "maskiningenjör", "miljöingenjör"]
    table_name = "engineer_field_job_ads"
    
    for query in queries:
        run_pipeline(query, table_name)