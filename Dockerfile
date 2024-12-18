FROM continuumio/miniconda3:latest

ADD EDTA /EDTA
WORKDIR /EDTA

RUN apt update && apt install -yqq unzip openjdk-17-jre && \
    rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* && \ 
    echo "name: EDTA2" >> EDTA_2.2.x.yml && \
    echo "y"|conda env create -f EDTA_2.2.x.yml
SHELL ["/bin/bash", "-c"]
RUN conda init && source ~/.bashrc && \
    conda activate EDTA2 && \
    echo "y"|conda install -q -c conda-forge -c bioconda -c r annosine2 biopython cd-hit coreutils genericrepeatfinder genometools-genometools glob2 tir-learner ltr_finder_parallel ltr_retriever mdust multiprocess muscle openjdk perl perl-text-soundex r-base r-dplyr regex repeatmodeler r-ggplot2 r-here r-tidyr tesorter samtools bedtools LTR_HARVEST_parallel HelitronScanner && \
    conda clean --all -y && \
    rm -rf /tmp/*

ENV PATH="/opt/conda/envs/env/bin:$PATH"

CMD ["/bin/bash"]
