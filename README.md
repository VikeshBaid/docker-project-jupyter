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

Code: /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebook --ip='*' --port=8888 --no-browser --allow-root"

For docker file: CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]

Description of last command:
1 --notebook-dir is jupyter config file parameter to specify the directory where all notebook will be saved
2 --ip is used to specify the ip address where you want to run server. I used '*' but you can provide your machines ip address
3 --no-browser is a flag which tells jupyter to stop lauching the browser as in container we do not have it
4 --allow-root is another flag which allow to run juypter with root privilege ( it is not best practice)

I also didn't create password for jupyter notebook you have to use either system generated token or you can given password of your own choice

Here with Dockerfile I also used docker-compose

Docker compose is method in which you create a script in yaml which help you launch all the required container, volume etc using single yaml script.
You can easily download docker compose from Google

In my docker-compse.yml scrpit /
1. I used version 3 of docker compose, there is a description about all the version of docker compose at https://docs.docker.com/compose/compose-file/compose-versioning
2. Every container you create is known as service in docker do I created a service. It has a volume in which I attach /opt/notebook.
3 I also specify port where docker container is exposed to outside world.

