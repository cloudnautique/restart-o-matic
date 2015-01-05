# Restart O Matic
-------
This is a little container that runs a job every minute to see if it should restart another docker container. Logs are in /var/log/restart_o_matic.log

###Building

```
docker build --rm -t restart-o-matic .
```

### Configuration
The file that feeds the restart-o-matic is called `container_watchers` 

The format of the file is: `<container id>.<HH>:<MM>` with one container per line.
The HH and MM need to be in UTC. 


### Running

```
docker run -d -v $(pwd)/container_watchers:/opt/container_watchers -v /var/run/docker.sock:/var/run/docker.sock restart-o-matic
```

### Background
Sometimes you need to rebuild an environment a couple times a day... 

This container has Docker installed and can watch the containers running on the host its running on. Which is how it is able to restart the other containers.
