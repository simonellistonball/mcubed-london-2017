FROM jupyter/all-spark-notebook

MAINTAINER Simon Elliston Ball <simon@simonellistonball.com>

USER root

# Install dlib
RUN apt-get update && \
  apt-get install -y build-essential cmake pkg-config libx11-dev libatlas-base-dev libgtk-3-dev libboost-python-dev\
    zlib1g-dev \
    libjpeg-dev \
    xvfb \
    libav-tools \
    xorg-dev \
    python-opengl \
    libboost-all-dev \
    libsdl2-dev \
    swig \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* 


# Install OpenCV_Face_Detection
RUN conda config --add channels menpo \ 
  && conda install --quiet --yes dlib opencv && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow=1.3*' \
    'keras=2.0*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR

USER $NB_USER
