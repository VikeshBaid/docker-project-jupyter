Jupyter on docker

Here I use a image from docker hub

Getting image: docker pull continuumio/anaconda3

For docker file: FROM continuum/anaconda3:latest

Next I install jupyter using conda( which is already in image I used)

Code: conda install jupyter -y

For docker file: absolute/path/to/conda install jupyter

Next set I set up a work directory where all the notebooks will be save

Work directory: mkdir /opt/notebook

For docker file: WORKDIR /opt/notebook

Next step is to expose port on which the jupyter server runs

Code : using -p flag 8888:8888 (host_port):(container_port)

For docker file: EXPOSE 8888

Next step is to run the server on container

Code: /bin/bash -c "/opt
