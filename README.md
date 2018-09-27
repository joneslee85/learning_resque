A basic resque app with a sleeper worker

## Setup

`bundle install`

and run Redis

`docker-compose up -d`

## Configuration

Please set `REDIS_URL` UNIX environment variable if you want to use different Redis, by default it would use our Docker Redis which is `redis://localhost:6381`

## Run worker

Start a worker easily with:

```
$ QUEUE=test_worker PIDFILE=./resque.pid bundle exec rake environment resque:work
```

Enqueue a job with:

```
$ irb
> require_relative './config/boot'
> Resque.enqueue(Sleeper, <time>) # <time> is how many seconds you want the job sleep
```

Kill the worker with:

```
$ kill `cat ./resque.pid`
```


