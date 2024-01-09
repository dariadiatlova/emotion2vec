FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
FROM tiangolo/uvicorn-gunicorn:python3.8

RUN apt-get update --fix-missing && apt-get install -y wget \
    libsndfile1 \
    sox \
    git \
    git-lfs

RUN python -m pip install --upgrade pip
RUN python -m pip --no-cache-dir install fairseq@git+https://github.com//pytorch/fairseq.git@f2146bdc7abf293186de9449bfa2272775e39e1d#egg=fairseq
COPY . /app

RUN git config --global user.email "lewis@huggingface.co"
RUN git config --global user.name "SUPERB Admin"
RUN pip install "numpy<1.24" soundfile

WORKDIR /app
CMD ["/bin/bash"]