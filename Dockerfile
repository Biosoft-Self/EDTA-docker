FROM continuumio/miniconda3:latest

ENV PATH="/opt/conda/envs/env/bin:$PATH"

ADD EDTA /EDTA
WORKDIR /EDTA
SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -yqq unzip openjdk-17-jre && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* && \ 
    echo "name: EDTA2" >> EDTA_2.2.x.yml && \
    echo "y"|conda env create -f EDTA_2.2.x.yml >/dev/null 2>&1 && \
    conda init && source ~/.bashrc && \
    conda activate EDTA2 && \
    echo "y"|conda install -c conda-forge -c bioconda -c r annosine2 biopython cd-hit coreutils genericrepeatfinder genometools-genometools glob2 tir-learner ltr_finder_parallel ltr_retriever mdust multiprocess muscle openjdk perl perl-text-soundex r-base r-dplyr regex repeatmodeler r-ggplot2 r-here r-tidyr tesorter samtools bedtools LTR_HARVEST_parallel HelitronScanner >/dev/null 2>&1 && \
    conda clean --all -y && \
    rm -rf /tmp/*

RUN echo "kernel.pid_max = 4194304" >> /etc/sysctl.conf && \
    echo "fs.file-max = 1000000">> /etc/sysctl.conf && \
    echo "net.core.somaxconn = 32768">> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_tw_recycle = 0">> /etc/sysctl.conf && \
    echo "net.ipv4.tcp_syncookies = 0">> /etc/sysctl.conf && \
    echo "vm.overcommit_memory = 1">> /etc/sysctl.conf && \
    echo "vm.swappiness = 0">> /etc/sysctl.conf && \
    echo "ulimit -n 65535" >> /etc/profile && \
    echo "sysctl -p" >> /etc/profile

CMD ["/bin/bash"]
