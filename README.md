# Project Name

> This service app acts as a data interface. It is designed to work within a wider eco system and only be exposed to systems and services within the systems boundary. It is not intended to be exposed to the outside world aka the internet

## Table of Contents

-   [General Info](#general-information)
-   [Technologies Used](#technologies-used)
-   [Features](#features)
-   [Setup](#setup)
-   [Usage](#usage)
-   [Room for Improvement](#room-for-improvement)
<!-- * [License](#license) -->

## General Information

This is a component of the nacho-banana app designed to expose data as a service without exposing the underlying technologies. Therefore it allows for additional database technologies and structures to evolve whilst respecting a single common interface for upstream requestors of data.

Generally this service has two functions, 1. To provide data as a service to requesting applications and 2. to abstract the data being requested from the underlying technologies used to provide the data.

The main purpose is to democratise data across various apps within the nacho-banana eco system. It is the focalpoint where data is served from.

## Technologies Used

-   TypeScript - Version 3.8.3
-   PostgreSQL - Version 12.8
-   Axios - Version 0.22.0,
-   express - Version 4.17.1,
-   morgan - Version 1.10.0,
-   pg - Version 8.7.1,
-   reflect-metadata - Version 0.1.13,
-   swagger-ui-express - Version 4.1.6,
-   tsoa - Version 3.13.0,
-   typeorm - Version 0.2.38

## Features

List the ready features here:

-   TypeORM integration
-   Swagger integration

## Setup

### Prerequsites

-   Have the correct version (see above) of postgres installed
-   Have a role with the correct credentials to create and populate a database
-   Have a role created with the name nacho and password nacho (password may not be necessary)
-   Have a database called cmc_data created with owner nacho
-   Have the correct version (see above) of TypeScript installed

The project dependencies can be installed with npm and are found in the [package.json](./package.json) file. To do this, run:

```bash
npm install
```

## Usage

### To run the server in dev type:

```bash
npm run dev1
```

You'll see some initialisation output and finally see the message: _Data Server running on http://localhost:3100/_

You can then navigate to the [swagger docs](http://localhost:3100/docs/) and can see the API description

### To run the server in production we first build it using:

```bash
npm run build
```

Note the output will create a ./build folder.

### To start the server use:

```bash
npm run start
```

This then starts the production app. You can confirm this again by navigating to [swagger docs](http://localhost:3100/docs/).

## Room for Improvement

There is a convoluted way to generate the database which can be improved. Speed was chosen over sense.
