# Docker Rails 4 Boilerplate

The intent of this boilerplate is to serve as example for Rails 4 projects created from scratch using Docker.

## Pre-requisites

1. Have docker installed
2. Have the preferable IDE installed to edit files
3. Have docker running

## How to use this files?

1. Copy Dockerfile, Gemfile and docker-compose.yml to a new folder where you want to create the Rails project
2. Run, inside the folder, the command `docker-compose build`
3. Now create the Rails app using `docker-compose run bundle exec rails new . --force --database=postgresql `
