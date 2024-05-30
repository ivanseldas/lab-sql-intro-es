-- Create the database
CREATE DATABASE IF NOT EXISTS lab_ironhack;

-- Use the database 
USE DATABASE lab_ironhack;

-- Create a new schema
CREATE SCHEMA IF NOT EXISTS lab_sql;

USE SCHEMA lab_sql;

-- Create a stage
CREATE OR REPLACE STAGE my_stage;

-- 1. Identify the total of complaints based on the type of complaint
SELECT COMPLAINT_TYPE, COUNT(*) AS TOTAL
FROM LAB_13_311_SERVICES_REQUESTS
GROUP BY COMPLAINT_TYPE
ORDER BY TOTAL DESC LIMIT 5;

-- 2. Analyse complaints per district
SELECT INCIDENT_ZIP, COUNT(*) AS TOTAL
FROM LAB_13_311_SERVICES_REQUESTS
GROUP BY INCIDENT_ZIP
ORDER BY TOTAL DESC;

-- 3. Filter high volume type of complaints
SELECT COMPLAINT_TYPE, COUNT(*) AS TOTAL
FROM LAB_13_311_SERVICES_REQUESTS
GROUP BY COMPLAINT_TYPE
HAVING TOTAL > 1000;

-- 4. Compare districts for a specific complaint
SELECT INCIDENT_ADDRESS, COUNT(*) AS TOTAL
FROM LAB_13_311_SERVICES_REQUESTS
WHERE COMPLAINT_TYPE = 'Street Condition' AND INCIDENT_ADDRESS IS NOT NULL
GROUP BY INCIDENT_ADDRESS
ORDER BY TOTAL DESC;