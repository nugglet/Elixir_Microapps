# Elixir Microapps

This repository is a collection of small elixir applications.

List of Projects:

1. [To-Do List](https://github.com/nugglet/Elixir_Microapps/tree/main/todo)
2. [Light Switch](https://github.com/nugglet/Elixir_Microapps/tree/main/lightswitch)

## General Dependencies

- Elixir V1.14
- Phoenix V1.6.14
- Phoenix Liveview
- PostgreSQL

> Linux users must install the inotify-tools filesystem watcher with `apt-get install inotify-tools`

## Notes

### Setting up PostGreSQL

> Phoenix assumes that our PostgreSQL database will have a `postgres` user account with the correct permissions and a password of `postgres`

#### In Conda

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

#### In Linux

1. Update and install postgres then start the service

```
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service
```

1. Log in to psql. The 'postgres' role is created by default. Modify it to change its password to `postgres`

```
sudo -i -u postgres
psql
/password psql
/q
```

### Setting up a new LiveView project

To install, run:
```
mix local.hex
mix archive.install hex phx_new
```

1. To create a new Phoenix application run `mix phx.new <appname>`

PostgreSQL is used by default. MySQL, MSSQL, or SQLite3 can be used by passing the `--database` flag when creating a new application. The `--no-ecto` flag can be used to disable ecto, the elixir package that talks to databases.
2. `cd` into project dir and run `mix ecto.create` to create db
3. Start server with `mix phx.server`
4. Generate and migrate the schema with `mix phx.gen.context` and `mix ecto.migrate`

## Learning Resources

- [Installing PostGreSQL with Anaconda](https://gist.github.com/gwangjinkim/f13bf596fefa7db7d31c22efd1627c7a)
- [Lifecycle of a Phoenix LiveView](https://pragmaticstudio.com/tutorials/the-life-cycle-of-a-phoenix-liveview)
- [Light Switch with Phoenix LiveView](https://pragmaticstudio.com/tutorials/getting-started-with-phoenix-liveview)
- [To-Do List with Phoenix LiveView](https://dennisbeatty.com/how-to-create-a-todo-list-with-phoenix-liveview/)