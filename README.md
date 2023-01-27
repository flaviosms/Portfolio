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