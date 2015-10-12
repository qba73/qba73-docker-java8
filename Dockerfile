FROM ubuntu:15.04
MAINTAINER Jakub Jarosz "qba73@postpro.net"

LABEL Description="This image provides Ubuntu and Java8" Version="1.0"

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main " > /etc/apt/sources.list.d/jdk.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update && apt-get install -y \
     build-essential \
     oracle-java8-installer \
     oracle-java8-set-default

RUN update-java-alternatives -s java-8-oracle \
  && apt-get autoremove \
  && apt-get clean

