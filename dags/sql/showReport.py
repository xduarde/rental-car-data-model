from airflow.hooks.postgres_hook import PostgresHook

def showReport():
    conn = PostgresHook(postgres_conn_id='postgres_default').get_conn()
    cur = conn.cursor()

    cur.execute("SELECT * FROM most_rental_cars LIMIT 100")
    sources = cur.fetchall()
    
    print(sources)
    print(f"car_id  |  reservations  |  avg_rental_time")
    for row in sources:
        print(f"{str(row[0])}    |        {str(row[1])}        |  {str(row[2])}")