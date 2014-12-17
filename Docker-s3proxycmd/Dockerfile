FROM debian:jessie
MAINTAINER emccode@emc.com

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y s3cmd

ADD ./run_s3_proxy_cmd.sh /bin/

ENTRYPOINT ["/bin/run_s3_proxy_cmd.sh"] 
CMD ["--help"]