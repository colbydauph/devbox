FROM ubuntu:latest

LABEL maintainer="colby@dauphina.is"

# install linux packages
RUN apt-get update -yq && \
    apt-get install -yq \
      apt-transport-https \
      curl \
      docker.io \
      git \
      sudo \
      unzip \
      vim \
      zip \
      && rm -rf /var/lib/apt/lists/*;

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yq && apt-get install -yq yarn

# install node 8 + npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -yq nodejs build-essential
# update npm
RUN yarn global add npm

# install typescript
RUN npm install -g typescript ts-node
# fixme: hack until ts-node#4 is released
# https://github.com/TypeStrong/ts-node/issues/437
RUN npm install @types/node
# alias typescript-node to ts
RUN ln -s $(which ts-node) "$(dirname $(which tsc))/ts"

# install n (node version manager)
RUN npm install -g n
RUN n latest -q

# add dev user
RUN useradd dev
# setup home
RUN mkdir /home/dev /home/dev/bin && chown -R dev: /home/dev && chown -R dev: /home/dev/bin
ENV HOME /home/dev
ENV PATH $PATH:/home/dev/bin
# ADD gitconfig /home/dev/.gitconfig
USER dev

COPY start.sh /.start.sh

WORKDIR /home/dev

VOLUME /home/dev/.aws \
       /home/dev/.bash_profile \
       /home/dev/.ssh

# node debugger
EXPOSE 9229

RUN git init

# install aws cli
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip -q awscli-bundle.zip && \
    ./awscli-bundle/install -b ~/bin/aws && \
    rm -R awscli-bundle.zip ./awscli-bundle;

CMD ["/bin/bash", "/.start.sh"] 