FROM ubuntu:latest
# docker build -t igv-vm:latest .
WORKDIR /igv
RUN apt-get update 
RUN apt-get install -yq wget

RUN apt-get install -yq unzip


RUN apt-get install -yq bash
RUN apt-get install -yq xvfb
RUN apt-get install -yq openjdk-11-jdk
RUN apt-get install -yq fontconfig
RUN apt-get install -yq git

WORKDIR /app
RUN git clone https://github.com/PankratzLab/IGV-VM.git


RUN wget https://data.broadinstitute.org/igv/projects/downloads/2.10/IGV_Linux_2.10.3_WithJava.zip
RUN unzip IGV_Linux_2.10.3_WithJava.zip

WORKDIR /igv/IGV_Linux_2.10.3



# ADD entrypoint.sh /app/IGV-VM/entrypoint.sh
ENTRYPOINT ["/bin/sh", "/app/IGV-VM/entrypoint.sh"]

