import time
from airflow.hooks.postgres_hook import PostgresHook

def copyData():
    conn = PostgresHook(postgres_conn_id='postgres_default').get_conn()
    cur = conn.cursor()

    car_rental_tables = ['rental_office', 'customers', 'available_cars', 'rented']

    for table in car_rental_tables:
        
        with open(f'dags/data/{table}.csv', 'r') as f:
            next(f) # Skip the header row.
            cur.copy_from(f, table, sep=',')

        time.sleep(10)

        conn.commit()