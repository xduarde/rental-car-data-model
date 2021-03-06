from sql.copyData import copyData
from sql.showReport import showReport
from datetime import datetime
from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.python import PythonOperator
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from airflow.utils.trigger_rule import TriggerRule


default_args = {
    'owner': 'airflow',
    'start_date': datetime(2022, 2, 4)
}


with DAG('rentalCarsWorkflow', default_args=default_args, schedule_interval=None, is_paused_upon_creation=False) as dag:
    
    # Create the car rental tables through SQL queries
    create_tables = PostgresOperator(
        task_id='create_rental_tables',
        sql='sql/create-rdb.sql'
    )

    # Execute the function which insert the data to the rental tables
    insert_data = PythonOperator(
        task_id=f'insert_data', python_callable=copyData
    )
    
    # List of tables
    car_rental_tables = ['rental_office', 'customers', 'available_cars', 'rented']

    for table in car_rental_tables:
        
        # Validate every table through SQL queries
        validate_tables = PostgresOperator(
            task_id=f'validate_{table}_table',
            sql='sql/validate-table.sql',
            params={'table': table}
        )

        # Declare task dependencies
        create_tables.set_downstream(validate_tables)
        validate_tables.set_downstream(insert_data)


    # Create aggregate table through SQL view query
    create_report = PostgresOperator(
        task_id='create_rental_report',
        sql='sql/create-report.sql'
    )

    # Show an aggregate table sample
    show_report = PythonOperator(
        task_id='show_report', python_callable=showReport
    )

    # Declare task dependencies
    insert_data.set_downstream(create_report)
    create_report.set_downstream(show_report)