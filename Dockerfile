#this tool uses python2.  we really shouldn't be using this.  It's now 4 years out-of-date and unmaintained.
#FROM continuumio/anaconda3
#version 1.0.0: 

#FROM continuumio/anaconda2
FROM ubuntu:20.04
MAINTAINER Billy Law

ENV TZ=America/Canada
ENV DEBIAN_FRONTEND=noninteractive



RUN apt-get update \
&& apt-get -y install wget \
&& apt-get -y install unzip



WORKDIR /metawrap
RUN wget https://repo.anaconda.com/archive/Anaconda2-2019.10-Linux-x86_64.sh
RUN sh Anaconda2-2019.10-Linux-x86_64.sh -b

RUN wget https://github.com/bxlab/metaWRAP/archive/refs/tags/v1.3.zip 
RUN unzip v1.3.zip
ENV PATH="${PATH}:/root/anaconda2/bin"
RUN apt-get install -y libarchive13

RUN conda config --add channels defaults
RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda
RUN conda config --add channels ursky
RUN conda install --only-deps -c ursky metawrap-mg
#RUN conda install -y logging
#RUN conda install -y mamba 

#RUN mamba install --only-deps -c ursky metawrap-mg




#


WORKDIR /
CMD ["bash"]