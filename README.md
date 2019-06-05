### Requirements
- [Docker](https://docs.docker.com/install/)

### Usage
Clone repository 
```
git clone git@github.com:ArtemRakov/todo_app.git
```

Copy and adjust if necessary env variables from .env.example
```
cp .env.example .env
```

From the folder execute the following command
```
docker-compose build
```
That command will prepare docker image with all necessary dependencies for the project. Inside the docker compose file we also have database as a service, so we don't need to have locally installed postgresql or redis.

Than we need to create database, run migrations and seeds 

```
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rails db:seed
```
Now you can run `docker-compose up ` if everything goes well you will be able to access to your app with http://localhost:3000

### Getting Started (locally)

[Install Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/setup.html). For Homebrew, use:

```sh
brew install elasticsearch
brew services start elasticsearch
```

The our version of gem works with Elasticsearch 6 and 7.


### Facebook login

In order to use facebook login locally. You need to add FB_ID and FB_SECRET to environment the example of which you can find in `.env.example`
