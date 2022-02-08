#!/usr/bin/env bash

echo "######################################"
echo "Initialize Airflow container      ####"
echo "######################################"

docker-compose up airflow-init

echo "######################################"
echo "Initialize Postgres Database      ####"
echo "######################################"

./airflow.sh db init

echo "######################################"
echo "Pre-trigger rentalCarsWorkflow Dag  ##"
echo "######################################"

./airflow.sh dags trigger rentalCarsWorkflow

echo "######################################"
echo "Initialize Airflow services       ####"
echo "######################################"

docker-compose up



