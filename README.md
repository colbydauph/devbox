## devbox

#### Personal Development Environment

[Docker Image](https://hub.docker.com/r/colbydauph/devbox)

| Features |  |
|---|---|
| **OS** | `ubuntu` |
| **General** | `git`, `vim`, `curl` |
| **Cloud** | `aws`, `docker` |
| **JavaScript**  | `node`, `npm`, `yarn`, `n`, `typescript`  |

#### Volumes
| mount point |  |
|---|---|
| `/home/dev/.bash_profile` | sourced at startup |
| `/home/dev/.ssh` | ssh keys |
| `/home/dev/.aws` | aws config |
| `/var/run/docker.sock` | docker socket |

#### Examples
```shell
# Build
$ docker build -t colbydauph/devbox .;

# Run
$ docker run -it colbydauph/devbox;

# Debug node
# visit chrome://inspect
$ docker run -it -p 9229:9229 colbydauph/devbox node --inspect=0.0.0.0:9229;

# Kitchen sink
$ docker run -it \
  -p 9229:9229 \
  -v ~/.bash_profile:/home/dev/.bash_profile:ro \
  -v ~/.ssh:/home/dev/.ssh:ro \
  -v ~/.aws:/home/dev/.aws:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  colbydauph/devbox;
```