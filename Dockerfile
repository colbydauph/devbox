FROM ubuntu:latest

LABEL maintainer="colby@dauphina.is"

# install linux packages
RUN apt-get update -yq
RUN apt-get install -yq git
RUN apt-get install -yq sudo
RUN apt-get install -yq vim
RUN apt-get install -yq curl
RUN apt-get install -yq apt-transport-https
RUN apt-get install -yq docker.io

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yq && apt-get install -yq yarn

# install node 8 + npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -yq nodejs
RUN apt-get install -yq build-essential
# update npm
RUN yarn global add npm

# install typescript
RUN npm install -g typescript

# install n (node version manager)
RUN npm install -g n
RUN n latest

# add dev user
RUN useradd dev
# setup home
RUN mkdir /home/dev && chown -R dev: /home/dev
ENV HOME /home/dev
COPY bash_profile /home/dev/.bash_profile
# ADD gitconfig /home/dev/.gitconfig

WORKDIR /home/dev

VOLUME /home/dev/.ssh
VOLUME /var/run/docker.sock

# node debugger
EXPOSE 9229

USER dev
RUN git init

CMD /bin/bash -c "source ~/.bash_profile; /bin/bash"

