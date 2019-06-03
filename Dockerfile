FROM ubuntu:18.04 as magma_image

RUN \
    apt-get update && apt-get install -yq python3 python3-pip python3-venv build-essential git cmake libmpfr-dev libmpc-dev && \
    apt-get clean && \
    git clone https://github.com/rdaly525/coreir.git && \
    cd coreir/build && \
    cmake .. && \
    make && \
    make install && \
    cd - && \
    python3 -m venv stanford


RUN \
    bash -c "source stanford/bin/activate && pip install --upgrade pip && pip install wheel pytest magma-lang dataclasses mantle"

RUN \
    bash -c "git clone https://github.com/phanrahan/magma"
