FROM cmsopendata/cmssw_10_6_8_patch1

USER    root

# Set the working directory
WORKDIR /home/cmsusr/

# Copy install.sh into the container
ADD install.sh /home/cmsusr/

RUN ./install.sh

# Allow incoming connections on port 8888
EXPOSE 8888

CMD ["/bin/bash"]
