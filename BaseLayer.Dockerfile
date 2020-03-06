FROM continuumio/miniconda

COPY . /src
WORKDIR /src

RUN cd /src && conda env create -f environment.yml

# Pull the environment name out of the environment.yml
RUN echo "source activate $(head -1 /src/environment.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /src/environment.yml | cut -d' ' -f2)/bin:$PATH
