# Business Management

## Scenario

You work for a normal company that does normal company stuff: selling normal products to normal people. You've been asked to dive into the existing database and write a series of queries to extract business-relevant information that will help the company meet its quarterly objectives.

There's absolutely nothing weird going on here at all; sometimes though, you find your gaze drifting towards the window as you dream of a more fantastical world.

Get set up with the project, and then **work through the tasks** listed below, creating the required queries.

## Setup and installation

1. Run `psql postgres -f northwind.sql` to create and populate the Northwind database
database.

## Tasks

The `./queries` folder contains a series of `.sql` files. Each one has comments describing a specific query; your task is to fill in the SQL of each query.

Each query file should produce the data described when run using the command `psql northwind --csv -f ./queries/[name of file]`. You can check `./example-results` to see example output for each query.

At the end of the challenge, all tests should pass.

## Marking

This assessment is primarily marked based on passing tests, though coaches reserve the right to add/remove discretionary marks.
