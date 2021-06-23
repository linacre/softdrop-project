# softdrop-project
```
git clone https://github.com/linacre/softdrop-project.git
docker build -t softdrop-project -f Dockerfile .
docker run --rm -v [your local results directory]:/results -it -p 8888:8888 softdrop-project
```

After entering the container (the docker run command above), the Jupyter notebook server can be launched and accessed as follows:

```
cd /results/
jupyter notebook --ip 0.0.0.0 --allow-root
```

The notebooks in your local results directory can then be run in your local web browser by navigating to http://127.0.0.1:8888/ (the required log-in token can be found in the output of the previous terminal command).

Note that the CMSSW docker image is quite large (~8 GB), so it may take some time to download and build. You may also need to increase the amount of memory allocated to Docker in the 'Resources' section of the Docker preferences page.
