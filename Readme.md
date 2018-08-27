```
$ bundle install
```

### Run rabbit
```
docker run -d --hostname my-rabbit --name bunny-rmq -p 5672:5672 rabbitmq:3
```

### Run server
```
ruby bin/background_runner.rb
```

### Run client
```
ruby app/do_any_job.rb
```
