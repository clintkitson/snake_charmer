
FROM debian:wheezy
MAINTAINER EMCCODE

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i '1i deb     http://gce_debian_mirror.storage.googleapis.com/ wheezy         main' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y curl
RUN yes | curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y sudo
RUN sudo apt-get install -y nodejs npm
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10



RUN npm install azure-cli -g

ENTRYPOINT ["/usr/bin/azure"]
CMD ["help"]
