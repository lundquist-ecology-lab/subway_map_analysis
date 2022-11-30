-- Import into SQL database
-- Create database
-- Database: subway_data

create database if not exists subway_data;

-- Use database
use subway_data;

-- Table: subway_data

create table if not exists subway_data (
    id int not null,
    borough VARCHAR(50) null,
    stations int null,
    g_stations int null,
    b_area DECIMAL(11,2),
    g_area DECIMAL(11,2),
    units VARCHAR(10) null,
    primary key(id))
    with system versioning
    partition by system_time (
    partition part_history history,
    partition part_current current
    );

-- Populate table 
load data local
infile 'subway_data.csv' 
into table subway_data fields terminated by ',' 
ignore 1 rows; --Ignore the top row