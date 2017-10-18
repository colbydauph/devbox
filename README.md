## devbox

#### Personal Development Environment

[Docker Image](https://hub.docker.com/r/colbydauph/devbox)

| Features |  |
|---|---|
| **OS** | `ubuntu` |
| **General** | `git`, `vim`, `curl`, `docker` |
| **JavaScript**  | `node`, `npm`, `yarn`, `n`, `typescript`  |


#### Examples
```shell
# Build
$ docker build -t colbydauph/devbox .;

# Run
$ docker run -it colbydauph/devbox;

# Debug Node
# visit chrome://inspect
$ docker run -it -p 9229:9229 colbydauph/devbox node --inspect=0.0.0.0:9229;

# Share SSH Keys
$ docker run -it -v ~/.ssh:/home/dev/.ssh:ro colbydauph/devbox;

# Access host docker
$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock colbydauph/devbox;
```