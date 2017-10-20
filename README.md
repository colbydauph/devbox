## devbox

This is my personal development environment. It contains some of the tools I use for software development.

Docker Image: [`colbydauph/devbox`](https://hub.docker.com/r/colbydauph/devbox)

#### Software
```
os      - ubuntu
general - curl, git, vim
util    - unzip, zip
cloud   - aws, docker
js      - node, npm, n, typescript, yarn
```

#### Mount Points
| path |  |
|---|---|
| `/home/dev/.aws` | [aws config](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) |
| `/home/dev/.bash_profile` | sourced at startup |
| `/home/dev/.ssh` | ssh keys |

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
  -v ~/.aws:/home/dev/.aws:ro \
  -v ~/.bash_profile:/home/dev/.bash_profile:ro \
  -v ~/.ssh:/home/dev/.ssh:ro \
  colbydauph/devbox;
```