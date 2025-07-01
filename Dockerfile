FROM ubuntu:latest
# docker build -t igv-vm:latest .
RUN apt-get update 

RUN apt-get install -yq wget

RUN apt-get install -yq unzip


RUN apt-get install -yq bash
RUN apt-get install -yq xvfb
RUN apt-get install -yq openjdk-11-jdk
RUN apt-get install -yq fontconfig
RUN apt-get install -yq git

WORKDIR /igv
ADD https://api.github.com/repos/jlanej/IGV-VM/git/refs/heads/main version.json

RUN git clone https://github.com/jlanej/IGV-VM.git
RUN chmod +x /igv/IGV-VM/entrypoint.sh

RUN wget https://data.broadinstitute.org/igv/projects/downloads/2.19/IGV_Linux_2.19.4_WithJava.zip
RUN unzip IGV_Linux_2.19.4_WithJava.zip

WORKDIR /igv/IGV_Linux_2.19.4


CMD ["/bin/bash"]
# ENTRYPOINT ["/bin/sh", "/igv/IGV-VM/entrypoint.sh"]

