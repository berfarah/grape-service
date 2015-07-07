# Grape Service

As I transition my projects to more manageable services, I'm making a [grape](https://github.com/intridea/grape)-based [Rack](https://github.com/rack/rack) service.

## Getting up and running
To start trying this out right away, make sure you have [docker](https://docs.docker.com/installation/) installed and run `docker-compose build`, `docker-compose run web su app -c bundle install`, `docker-compose up`

**TODO:**
* Add messaging queue (like RabbitMQ) for communicating between services
