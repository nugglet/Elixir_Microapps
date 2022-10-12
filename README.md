# Elixir Microapps

This repository is a collection of small elixir applications.

List of Projects:

1. [To-Do List](https://github.com/nugglet/Elixir_Microapps/tree/main/todo)

## General Dependencies

- Elixir V1.14
- Phoenix Liveview
- PostgreSQL

> Linux users must install the inotify-tools filesystem watcher

## Notes

### Setting up PostGreSQL in Conda

> Phoenix assumes that our PostgreSQL database will have a `postgres` user account with the correct permissions and a password of `postgres`

1. Install postgres: conda install -c anaconda postgresql
2. create local base db: `initdb -D <basename>`
3. start the db instance: `pg_ctl -D <basename> -l logfile start`
4. create non-superuser acc (for safety): `createuser --encrypted --pwprompt <username>`
5. create inner db within base: `createdb --owner=<username> <innername>`
6. connect app with inner db: see section below

7. To stop: us `ps` to find and kill root

psql commands (used with `psql --username=<username>`):

- `-l`: list all databases
- `-\c <dbname>`: connect/switch to a certain database
- `-dt`: list all tables in the current database using your search_path
- `-dt *.`: list all tables in the current database regardless your search_path

- `dropdb <dbname>`: delete db

### Setting up a new LiveView project

1. To create a new Phoenix application run `mix phx.new <appname>`

PostgreSQL is used by default. MySQL, MSSQL, or SQLite3 can be used by passing the `--database` flag when creating a new application. The `--no-ecto` flag can be used to disable ecto, the elixir package that talks to databases.
2. cd into project dir and run `mix ecto.create`

## Learning Resources

- [Installing PostGreSQL with Anaconda](https://gist.github.com/gwangjinkim/f13bf596fefa7db7d31c22efd1627c7a)
