# Jupyter on docker

Here I use a image from docker hub

**Getting image:** `docker pull continuumio/anaconda3`

**For docker file:** `FROM continuum/anaconda3:latest`

Next I install jupyter using conda( which is already in image I used)

**Code:** `conda install jupyter -y`

**For docker file:** `absolute/path/to/conda install jupyter`

Next, I set up a __work directory__ where all the notebooks will be save

**Work directory:** `mkdir /opt/notebook`

**For docker file:** `WORKDIR /opt/notebook`

Next step is to __expose__ port on which the jupyter server runs

**Exposing Port:** `using -p flag 8888:8888 (host_port):(container_port)`

**For docker file:** `EXPOSE 8888`

Next step is to __run__ the server on __container__

**Code:** `/bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebook --ip='*' --port=8888 --no-browser --allow-root"`

**For docker file:** `CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]`

#### Description of last command:
1. **--notebook-dir** is jupyter config file parameter to specify the __directory__ where all __notebook__ will be saved.
2. **--ip** is used to specify the __ip address__ where you want to run server (I used `'*'` but you can provide __your machines ip address__).
3. **--no-browser** is a flag which tells jupyter to stop lauching the browser as in container we do not have it.
4. **--allow-root** is another flag which allow to **run juypter** as **root**( it is not best practice).

I also didn't create any password for jupyter notebook. Jupyter provides system generated token.You can use either token or you can give password of your own choice.

Here with **Dockerfile** I also used **docker-compose**

**Docker compose** is method in which you create a script in __yaml__ which help you launch all the required **container, volume etc using single yaml script.**

You can easily download docker compose from Google

In my __docker-compse.yml__ scrpit:

1. I used `version: 3` of __docker compose__, there is a description about all the version of docker compose at (https://docs.docker.com/compose/compose-file/compose-versioning)
2. Every container you create is known as service in docker. I created a service `jupyteros`. It has a **volume** in which I attach `/opt/notebook`.
3. I also specify **port** `8888:8888` where docker container is exposed to outside world.
4. Then, I used `build` keyword which is used to build the docker using Dockerfile. Both docker-compose.yml and Dockerfile should be present in same folder, if not you must explicitly mention the pathe path of Dockerfile to docker-compose. 

