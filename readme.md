# Database Backup Files
This folder contains the database backup files for the project. The files are in the format of .tar and plain sql. You can use either of them to restore the database.

## Pre-requisites
1. PostgreSQL Version 14.8.0
2. pg_restore (pg_restore is a part of PostgreSQL installation)

## Steps to restore the database using .tar file
1. Open the terminal and navigate to the folder where the .tar file is located.
2. Run the following command to restore the database:
```bash
pg_restore -U <username> -d <database_name> <file_name>.tar
```

## Steps to restore the database using .sql file
1. Open the terminal and navigate to the folder where the .sql file is located.
2. Run the following command to restore the database:
```bash
psql -U <username> -d <database_name> -f <file_name>.sql
```

## Note
1. The database backup files are created using PostgreSQL version 14.8.0. If you are using a different version of PostgreSQL, you may encounter errors while restoring the database.
2. The database backup files are created using the username "sistadm_write". If you are using a different username, you may encounter errors while restoring the database.
3. The database backup files are created using the database name "sistadm". If you are using a different database name, you may encounter errors while restoring the database.
4. The database backup files are created using the schema name "public". If you are using a different schema name, you may encounter errors while restoring the database.


## Authors
- [Bijay Sharma](https://github.com/BijaySharma)
- [Sefali Basnet](https://github.com/sefalibasnet)





