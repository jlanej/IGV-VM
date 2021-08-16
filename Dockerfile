FROM ubuntu:latest
WORKDIR /igv
RUN apt-get update 
RUN apt-get install -yq wget

RUN wget https://data.broadinstitute.org/igv/projects/downloads/2.10/IGV_Linux_2.10.3_WithJava.zip
RUN apt-get install -yq unzip

RUN unzip IGV_Linux_2.10.3_WithJava.zip

RUN apt-get install -yq bash
RUN apt-get install -yq xvfb
RUN apt-get install -yq openjdk-11-jdk
RUN apt-get install -yq fontconfig

WORKDIR /igv/IGV_Linux_2.10.3

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

