FROM ubuntu:14.04
MAINTAINER reachlabkr <reachlab.kr@gmail.com>

# Bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# iTorch
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential \
    curl \
    git \
    cmake \
    libqt4-core libqt4-gui libqt4-dev \
    libjpeg-dev libpng-dev \
    ncurses-dev imagemagick libgraphicsmagick1-dev \
    libzmq3-dev \
    gfortran \
    unzip \
    gnuplot gnuplot-x11 \
    libsdl2-dev \
    python \
    python-dev \
    python-urllib3 \
    python-pip \
    python-zmq \
    python-software-properties \
    software-properties-common \
    nodejs npm \
    libfftw3-dev sox libsox-dev libsox-fmt-all \
    libopenblas-dev \
    python-virtualenv

RUN cd $HOME && virtualenv iPython
RUN cd $HOME && source iPython/bin/activate && \
pip install jinja2 sphinx pygments tornado nose pyzmq readline && \
pip install ipython[all]
RUN cd $HOME && curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash && \
git clone https://github.com/torch/distro.git ./torch --recursive && cd ./torch && ./install.sh -b 
ENV PATH=/root/torch/install/bin:$PATH
ENV LD_LIBRARY_PATH=/root/torch/install/lib:$LD_LIBRARY_PATH
ENV DYLD_LIBRARY_PATH=/root/torch/install/lib:$DYLD_LIBRARY_PATH
RUN cd $HOME && git clone https://github.com/facebook/iTorch.git && cd iTorch && luarocks make
RUN luarocks install parallel
RUN cd $HOME && mkdir volume 

VOLUME /root/volume

EXPOSE 8888

CMD cd $HOME && source iPython/bin/activate && cd volume && itorch notebook --ip='*' --no-browser
