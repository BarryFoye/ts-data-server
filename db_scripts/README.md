# Intro

The database used is postgres. Through a process of graphical design and auto generation using tools we have created a reproducable postgres database from the generated schema along with typeorm entity models.

The motivation for taking this approach is speed. We intend to upgrade to a standard way in the future. Until then here's how we did it.

## Flow

1. Design export: We used [app db designer](https://app.dbdesigner.net) which usefully generates SQL script to create the initial database.
2. Initial database generation: For this we used postgresql to ingest the app designer script and creat the initial postgres database.
3. Second export: Using pg_dump we then generate an exact schema of the initial database. We do this as postgres has added some explicit sequencing and documentation.
4. Final database generation: We then use the output from step 3 to create the final database.
5. Entity generation: In this step we use [typeorm-model-generator](https://github.com/Kononnable/typeorm-model-generator) to create the typeorm entities/models in order to ensure the data-server is compatible with the database itself.

## Steps

### Design export

In this step we design and generate the database with dbdesigner.

#### Prerequsites

-   Have an account on [app db designer](https://app.dbdesigner.net)

#### Process

1. Create a new schema
2. Do some modelling
3. When complete select "export" (ctrl + e)
4. Under database select postgreSQL
5. Select generate
6. Either copy the generated code and save it somewhere (post_gres_schema.sql in our case)
7. Review the code [post_gres_schema](./post_gres_schema.sql)

### Initial database generation

Next we will use our instance of postgreSQL to add our schema to the database

#### Prerequsites

-   Have postgres installed
-   Have a role with the correct credentials to create and populate a database
-   Have a role created with the name nacho and password nacho (password may not be necessary)
-   Have a database called cmc_data (for this example anyway) created with owner nacho

#### Process

1. The following is an example of the generation command:

```bash
psql -U postgres cmc_data < /path/to/location/of/ts-data-server/db_scripts/post_gres_schema.sql
```

replacing "path/to/location/of/" with the relatve or absolute path. If all worked you'll see:

```
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
ALTER TABLE
```

### Second export

We will now use pg_dump to export the database schema from postgreSQL.

#### Prerequsites

-   Complete previous steps

#### Process

1. The export command is as follows:

```bash
pg_dump -U postgres -d cmc_data -s > /path/to/location/of/ts-data-server/db_scripts/dbs.sql
```

replacing "path/to/location/of/" with the relatve or absolute path.

2. Review the output [dbs.sql](./dbs.sql).

This now gives us a reproducable database with some explicit sequencing. There is a number of flags that can be set on pg_dump and it is worth exploring but for now this suits what we need and we will upgrade as needed.

### Final database generation

We will now recreate the database using the newly generated file.

#### Prerequsites

-   Drop the database cmc_data and then create it again. The result is having an empty database called cmc_data
-   Ensure teh owner of the database is nacho

#### Process

1. Enter the following schema generation code:

```bash
psql -U postgres cmc_data < /path/to/location/of/ts-data-server/db_scripts/dbs.sql
```

replacing "path/to/location/of/" with the relatve or absolute path.

you should see a similar output (truncated for readability):

```
SET
...
SET
 set_config
------------

(1 row)

SET
...
SET
CREATE TABLE
ALTER TABLE
...
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
...
ALTER TABLE
```

2. Connect to the postgreSQL instance and use `\l` and you should see something similar:

```sql
List of databases
   Name    |  Owner   | Encoding | Collate |  Ctype  |   Access privileges
-----------+----------+----------+---------+---------+-----------------------
 cmc_data  | nacho    | UTF8     | C.UTF-8 | C.UTF-8 |
```

### Entity generation

Finally we will generate our entities from the database we just created. This will ensure our typeorm entities/models are compatible. Again this was done for speed and is not the best way of doing this.

#### Prerqusites

-   Ensure you are familiar with the [typeorm-model-generator](https://github.com/Kononnable/typeorm-model-generator) tool
-   Have a temporary working folder
-   Have node and npm/x installed

#### Process

1. Within the temp working folder run the following:

```bash
npx typeorm-model-generator -h localhost -d cmc_data -u nacho -x nacho -e postgres -o .
```

If you run into any connection errors or tables not found error, make sure that the user/role you are running from matches the `-u` user/role you are specifying in the command.

2. after generation is complete you should copy the generated entities to your models folder, insuring the index.ts is using the correct names of the data classes. You can review ormconfig.json and tsconfig.json that were generated, however the [tsconfig.json](../tsconfig.json) and [database.ts](../src/config/database.ts) files already incorporate the useful parts of these.

3. We need to update the newly generated classes with the Non-Null Assertion Operator (!)...!. So in each file you justy copied into the model folder you need to add an ! for each variable being created to tell the compiler that these values will be non null. So in the Coin.ts we change:

```typescript
 @PrimaryGeneratedColumn({ type: "integer", name: "coin_id" })
  coinId: number;
```

to

```typescript
 @PrimaryGeneratedColumn({ type: "integer", name: "coin_id" })
  coinId!: number;
```

Noting we added the **!** to **coin:** to get **coin!:**.
Continue this untill all variables have this format.

## Summary

We have now completed the Database model generation and implementation. You can now run `npm run serve` and you should see the output:

`Data Server running on http://localhost:3100/`
