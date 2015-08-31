# mysql-vagrant

mysql-vagrant is a quick way to run mysql locally for development without an ssh tunnel

Before using, copy the database file in to this directory, and name it database.sql.gz. It will be automatically loaded on initialization.

### Start server

     $ vagrant up

### Connect to mysql:

- host: 33.33.33.1
- username: root
- password: root

### Warning

For development use only, do not use in production.
Also, make sure your mysql port (3306) is not open on your computer for a local network or in general.

### License

MIT
