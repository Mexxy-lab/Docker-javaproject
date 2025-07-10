## This is a Docker project for containerization of a Java project with a multi-tier backend service

    - This project containerizes the entire backend services 
    - Services include MySQL, Memcache, RabbitMQ, Tomcat services 
    - Application frontend is written in java
    - A docker-compose file to bring up all containers for backend services 
    - Note application source code is strictly in the src/ folder. 

## Pre-requisites 

    - Ensure you have docker engine installed on your local PC 
    - You can also install docker desktop if you want 
    - Create a dockerhub account for hosting your built images 

## Project Architecture 

![alt text](pictures/image.png)


## Set up Docker file for the backend services and run below command to build images 

    ```bash
    
