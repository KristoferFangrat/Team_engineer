import streamlit as st
from connect_data_wh import query_job_listing

def layout():
    df = query_job_listing()

    engineer_types = ["All"] + sorted(df["ENGINEER_TYPE"].unique().tolist())
    st.title("Job listing for Engineering")
    st.write("This dashboard shows the job listing for Engineering from arbetetsformedlingens API")
    


    st.markdown("Filters")
    cols = st.columns(4)


    with cols[0]:
        selected_engineer_type = st.selectbox("Filter by Engineer Type", engineer_types)
    
    with cols[1]:
        min_date = df["PUBLISHED"].min().date()
        max_date = df["PUBLISHED"].max().date()
        start_date = st.date_input("Start Date", min_date)

    with cols[2]:
        end_date = st.date_input("End Date", max_date)
    
    with cols[3]:
        st.write("")

    where_clauses = []

    st.markdown("## Type of Engineers")
    cols = st.columns(1)

    with cols[0]:
        selected_engineer_type = st.selectbox("Filter by Engineer Type", engineer_types)


    if selected_engineer_type != "All":
        where_clauses.append(f"ENGINEER_TYPE = '{selected_engineer_type}'")
    where_clauses.append(f"PUBLISHED >= '{start_date}' AND PUBLISHED <= '{end_date}'")
    where_clause = "WHERE " + " AND ".join(where_clauses) if where_clauses else ""

    filtered_df = query_job_listing(f"SELECT * FROM mart_job_listings {where_clause}")

    # Update metrics
    st.markdown("## Filtered Vacancies")
    cols = st.columns(3)
    with cols[0]:
        st.metric(label="Total (Filtered)", value=filtered_df["VACANCIES"].sum())
    with cols[1]:
        st.metric(label="In Stockholm (Filtered)", value=filtered_df.query("WORKPLACE_CITY == 'Stockholm'")["VACANCIES"].sum())
    with cols[2]:
        st.metric(label="In Göteborg (Filtered)", value=filtered_df.query("WORKPLACE_CITY == 'Göteborg'")["VACANCIES"].sum())


 
    where_clause = f"WHERE ENGINEER_TYPE = '{selected_engineer_type}'" if selected_engineer_type != "All" else ""

    cols = st.columns(2)
   
    with cols[0]:
        st.markdown("### Per city")
        st.dataframe(
            query_job_listing(
                f"""
                SELECT
                    SUM(vacancies) as vacancies,
                    workplace_city
                FROM
                    mart_job_listings
                {where_clause}
                GROUP BY
                    workplace_city
                ORDER BY vacancies DESC;
                """
            )
        )
    with cols[1]:
        st.markdown("### Per company (top 5)")
        st.bar_chart(
            query_job_listing(
                f"""
                SELECT
                    SUM(vacancies) as vacancies,
                    employer_name
                FROM
                    mart_job_listings
                {where_clause}
                GROUP BY
                    employer_name
                ORDER BY vacancies DESC
                LIMIT 5;
                """
            ),
            x="EMPLOYER_NAME",
            y="VACANCIES",
        )


    st.markdown("## find advertisement")

    cols =st.columns(2)

    with cols[0]:
        selected_company = st.selectbox("select a company", df["EMPLOYER_NAME"].unique())

    with cols[1]:
        selected_headline = st.selectbox(
            "Select an advertisement",
            df.query("EMPLOYER_NAME == @selected_company")["HEADLINE"],
            )
    

    st.markdown("### Job ad")
    st.markdown(
        df.query("HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company"
        )["DESCRIPTION_TEXT"].values[0], 
        unsafe_allow_html=True,
    )


    st.markdown("### Job listings data")
    st.dataframe(df)


if __name__ == "__main__":
    layout()
