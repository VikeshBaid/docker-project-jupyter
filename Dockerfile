#official image
FROM continuumio/anaconda3

# jupyter installation
RUN /opt/conda/bin/conda install jupyter

# working directory
RUN mkdir /opt/notebook
WORKDIR /opt/notebook

# expose port 8888 where jupyter is running
EXPOSE 8888

# command to setup ip, port and notebook-dir
CMD ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]
