
FROM debian:wheezy
MAINTAINER EMCCODE

ENV DEBIAN_FRONTEND noninteractive

# Modeled from https://registry.hub.docker.com/u/dgageot/gcloud/dockerfile/
# Install pre-requisites
#
RUN sed -i '1i deb     http://gce_debian_mirror.storage.googleapis.com/ wheezy         main' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
  openjdk-7-jre-headless \
  openssh-client \
  php5-cgi \
  php5-cli \
  php5-mysql \
  python \
  unzip \
  wget \
  python-pip \
  python-dev \
  libffi-dev
  && apt-get clean

RUN easy_install pyOpenSSL

# Install gcloud
#
RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip \
    && unzip google-cloud-sdk.zip \
    && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --disable-installation-options

VOLUME ["/root/.config"]
ENV PATH /google-cloud-sdk/bin:$PATH

RUN yes | gcloud components update
RUN yes | gcloud components update preview
VOLUME ["/files"]

ENV CLOUDSDK_PYTHON_SITEPACKAGES 1

ADD ./run_gcloud.sh /bin/
RUN chmod +x /bin/run_gcloud.sh

ADD ./run_gsutil.sh /bin/
RUN chmod +x /bin/run_gsutil.sh

ENTRYPOINT ["/bin/run_gcloud.sh"] 
CMD ["help"]
