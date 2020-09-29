#!/bin/bash

echo "Setting up ${CMSSW_VERSION}"
source /opt/cms/cmsset_default.sh
scramv1 project CMSSW ${CMSSW_VERSION}
cd ${CMSSW_VERSION}/src
eval `scramv1 runtime -sh`
echo "CMSSW should now be available."

git config --global user.github $(whoami)
git config --global user.name $(whoami)
git config --global user.email $(whoami)

git cms-addpkg -y PhysicsTools/NanoAOD
git cms-addpkg RecoBTag/Combined
#git cms-merge-topic andrzejnovak:DDXV2_106
git clone https://github.com/cms-data/RecoBTag-Combined.git RecoBTag/Combined/data
git clone https://github.com/cms-jet/NanoAODJMAR.git PhysicsTools/NanoAODJMAR
git clone https://github.com/cms-nanoAOD/nanoAOD-tools.git PhysicsTools/NanoAODTools
git clone https://github.com/cms-jet/NanoAODJMARTools.git PhysicsTools/NanoAODJMARTools

# to install a newer version of fastjet:
#sudo chown -R $(whoami) /usr/local/
#wget http://fastjet.fr/repo/fastjet-3.3.4.tar.gz && tar xzf fastjet-3.3.4.tar.gz && rm fastjet-3.3.4.tar.gz && cd fastjet-3.3.4 && ./configure --enable-pyext && make && make install && cd ..
#wget http://fastjet.hepforge.org/contrib/downloads/fjcontrib-1.045.tar.gz && tar xzf fjcontrib-1.045.tar.gz && rm fjcontrib-1.045.tar.gz && cd fjcontrib-1.045 && ./configure  && make && make install && make fragile-shared-install && cd ..
#cp fastjet*.xml $CMSSW_BASE/config/toolbox/$SCRAM_ARCH/tools/selected/

scram setup fastjet
scram setup fastjet-contrib
scram b -j 10
