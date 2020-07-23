FROM continuumio/miniconda3:latest

LABEL Description="This image is used to run reproducible Python3 scripts and notebooks from the provided conda_environment.yaml file" Version="0.1"

RUN apt-get install -y curl

RUN echo 'Installing NodeJS for building Jupyter Lab assets.'

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get update --fix-missing & apt-get install -y nodejs && apt-get clean

ENV conda="/opt/conda/bin/conda"

WORKDIR /data
COPY conda_environment.yml /data/

RUN head /data/conda_environment.yml

RUN conda update --all
RUN conda env update -f /data/conda_environment.yml --prune

RUN echo 'Base conda environment has been updated.'

# RUN cat PATH="/opt/conda/bin:$PATH">> /root/.bashrc  

CMD jupyter lab --port 8080 --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token='' --NotebookApp.password=''
