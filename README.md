# Car Rental - Data Model

Car Rental data model developed in Python, orchestrated in Airflow and implemented in Docker.


## Getting Started

### Installation

Clone the repository and access its folder.

```bash
git clone https://github.com/xduarde/rental-car-data-model.git
```
```bash
cd rental-car-data-model
```


## Usage

The Car Rental data model is built and desinged in a relational database (PostgreSQL). Besides, the data model is deployed from a [Docker](https://docs.docker.com/get-docker/) container, through an [Airflow image](https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html).

The shell executable command deploys the environment and initialize the ETL:

```bash
./workflow.sh
```

This script executes the commands which:

1. **Deploys the Airflow container** 
2. **Initializes the PostgreSQL database** 
3. **Initializes the Airflow services** 
4. **Triggers the rentalCarsWorkflow Dag** 
    - Create the related tables.
    - Validate the tables.
    - Insert/copy the data.
    - Create the view/report (the most rented cars & average usage time).
    - Show the view/report.

In order to monitor the rentalCarsWorkflow, access the Airflow Web Server in:

> **[http://localhost:8080/](http://localhost:8080/)** 

***User & password:*** airflow


## Data Model

![alt text](/img/car-rental.png)

The [Cornell Car Rental Database](https://www.kaggle.com/kushleshkumar/cornell-car-rental-dataset) was used to create the files which feed the four tables. 


## License

Distributed under the MIT License. See LICENSE for more information.