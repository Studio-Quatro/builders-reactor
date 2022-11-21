# README

## Versions

- Ruby 3.1
- Rails 7.0.3

## Instructions to run locally

- Bundle dependencies.
- Create database with rails db:create.
- Run migrations with rails db:migrate.

## Env variables

To login:

    ADMIN_USERNAME=
    ADMIN_PASSWORD=

## Description

This repository stores a microservice to keep two external services via API Rest
up-to-date: Builders World store and Buildxact catalog.

The main idea is to serve as a chain of responsibility to make the following steps:

- Obtain data of products from Builders World shop.
- Obtain data of categories from Builders World shop.
- Obtain data from products from a Buildxact catalog.
- Obtain data from products from a Buildxact catalog.
- Map products between both services.
- Map categories between both services.
- Make a list of differences using the last update date (with Builders World as
the source of truth).
- Perform the required changes in the list on Buildxact API.

This chain allows you to understand the main functionality requirements.

Some of the non-functionality requirements are:

- Login required (with fixed admin user). Credentials could be set via env vars.
- Should be running automatically once a week.
- Should support an average of 3000 products and 400 categories serving the whole
process less than 4 hours.## Versions

- Ruby 3.1
- Rails 7.0.3

## Instructions to run locally

- Bundle dependencies.
- Create database with rails db:create.
- Run migrations with rails db:migrate.

## Deploy

- Copy master.key
- Set ENV vars as shown on .env.example.

## Gem to configure some cositas

https://github.com/huacnlee/rails-settings-cached

## Files involved on B.L.

![image](https://user-images.githubusercontent.com/20209667/203053632-960592b7-a3a3-4f21-8dd5-c92e110a2852.png)

## Diagrams

![image](https://user-images.githubusercontent.com/20209667/203053961-1231ffe3-f3e0-4e1f-8083-392268f433ab.png)

![image](https://user-images.githubusercontent.com/20209667/203054076-407ec3b0-41f0-4ad5-9da2-520b83551d14.png)

## Architecture

### Layers and design patterns

![image](https://user-images.githubusercontent.com/20209667/203054406-93947e6f-e397-4e64-abc2-057abdb78a75.png)

![image](https://user-images.githubusercontent.com/20209667/203055260-687e2076-6a33-4850-8d7d-6e3d92218842.png)

![image](https://user-images.githubusercontent.com/20209667/203054076-407ec3b0-41f0-4ad5-9da2-520b83551d14.png)
