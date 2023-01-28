# Data Engineer Challenge/Portfolio Project
Welcome to my Data Engineer Project, Here I created a Data Architecture using a example company that deals with all types of transports, be it aerial, maritime or terrestrial.
The challenge was to deliver data from a diverse pool of sources to a Data science, Data Analyst Team usage.

## About the Sources
- A Kafka Topic, delivering location data with 15 minute intervals.
- A Web API for weather data to be used as a complement to the location data
- Performance statistics about the transport unit, delivered into a PostGreSQL which would update randomly once a day, the challenge constraints it to poll the data every hour.
- A slow Changing PostgreSQL database containing Transport unit descriptions such as name, id, etc.

## About the Usage

- Get the data to an algorithm that creates AI models to predict resource usage by transport units.
- Visualise data aggregates such as count, mean, ninety percentile in analytics dashboards. 

## Architecture Overview

![Alt text](Diagrams/Architecture.png?raw=true "Solution architecture")

This is the Diagram of the proposed solution.
We can make out 4 different sections.
- Inputs: the Data inputs for our system.
- Extraction and loading: All structures that get the inputs and store them on our storage system.
- Development: Its the development enviroment and tools proposed to be used in structuring new solutions that use our data.
- Near Real Time Pipelines: Here we have our production AI models or Dashboards.

## Extraction

For the extraction I'm proposing a unified approach, sending all our PostgreSQL data into Kafka as well using Debezium CDC. After all the data is in Kafka, we can use Kafka Connect's Sink connector to S3, after that we treat the data to convert it into Delta format using Spark-Streaming to maintain our data flowing near real time.
For the Location Topic we can add the weather location data Using User Defined Functions.

### Alternatives:
PostGreSQL:
- We can also use spark to directly pull data from the database using a JDBC connecting and a incremental logic, with this method we can use Spark-Streaming or SparkProcesses orchestraded by some tool like Airflow. 
- Due to the slow changing nature of the Data specially for the Description Data, using Orchestraded processes can use less resources but will create the need to use and maintain a new set of tools.

Weather API:
- Another possibility which could be faster would be the usage of Lambda-functions to enrich our Json files that got stored in the landing zone. Depending on the volumetry and the way that the data needs to be partitioned when sinking to S3, the lambda process can run very fast and allow for a better time in the end.
- Attempting to make the pipeline simpler I propose the use of Spark-streaming, with UDF usage for this API call.

## Development 


Once the data gets to the Bronze layer in Delta(parquet) format, our data Analysts and Data Scientists can analyse that data for usage in their products.<br/>

- To consume the data from Bronze layer a great way is to use Spark with a EMR cluster using notebooks to get the data from Bronze layer, using that we can process the Data using a cluster's processing power. <br/>

- To get Data into Redshift we can use the Spectrum service to scan our S3 delta data. Once the data is in Redshift the analysts can process the data using distributed processing power while writing in SQL. This is great for Analysts who are closer to business and don't have expertise in Python for example.

- Another way to visualize the data is using Athena, the athena can consume Data directly from S3 by generating a Symlink and Maintaining the Metadata for the table up to date to allow reading of new partition using msck repair table or alter table add partition.<br/>
From Athena you can use a odbc connector Simba Athena to plug the S3 data into PowerBI.<br/>
This method is not recomended for aggregations of large datasets as Athena Charges per gb transfered. Using a programming language or Redshift would be preferred.

- The last Method proposed is to simply use Python or other programming language in a local machine or a Ec2 this can be great to test a few Data science algorithms.

### Alternatives:

To automate the Transfer of data to our development enviroments, I assumed we don't need real time data, so there is a option to use Airflow to automate this branch of the pipeline.

Other Visualization tools could be used as well such as Superset which can be hosted in EKS and makes use of distributed processing while providing a Dashboard Tool as well as a SQl_Lab. It can consume Data from Athena and/or from redshift same as PowerBI can.

## Getting transformations to Production

Once the transformations are tried and tested in development, the data engineering team can translate the treatment to a sparkstreaming process to allow for near real time Dashboards and predictions.


