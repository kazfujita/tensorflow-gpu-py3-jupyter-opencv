FROM tensorflow/tensorflow:1.14.0-gpu-py3-jupyter

# https://github.com/conda-forge/pygridgen-feedstock/issues/10
RUN apt update && \
    apt install -y --no-install-recommends \
        libgl1-mesa-glx \
        libopenblas-dev \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/**

RUN pip install --no-cache-dir -U pip setuptools && \
    pip install --no-cache-dir numpy --no-binary :all: && \
    pip install --no-cache-dir opencv-python pandas
