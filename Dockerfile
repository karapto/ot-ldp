FROM python:3.9-slim-buster

RUN apt-get update

RUN apt-get -y install git
RUN apt-get install -y python3-pip
RUN apt-get install -y iproute2
RUN apt-get install -y procps

RUN git clone https://github.com/karapto/ot-ldp.git
WORKDIR /ot-ldp
RUN pip3 install -r requirements.txt


