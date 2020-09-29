# softdrop-project
git clone https://github.com/linacre/softdrop-project.git
docker build -t softdrop-project -f Dockerfile .
docker run -v [your local results directory]:/results -it softdrop-project
