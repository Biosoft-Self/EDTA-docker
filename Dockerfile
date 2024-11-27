FROM continuumio/miniconda3:latest

ADD EDTA /EDTA

WORKDIR /EDTA

RUN echo "name: EDTA2" >> EDTA_2.2.x.yml && \
    echo "y"|conda env create -f EDTA_2.2.x.yml
RUN echo "source activate EDTA2" > ~/.bashrc

RUN echo "y"|conda install -c conda-forge -c bioconda -c r annosine2 biopython cd-hit coreutils genericrepeatfinder genometools-genometools glob2 tir-learner ltr_finder_parallel ltr_retriever mdust multiprocess muscle openjdk perl perl-text-soundex r-base r-dplyr regex repeatmodeler r-ggplot2 r-here r-tidyr tesorter samtools bedtools LTR_HARVEST_parallel HelitronScanner && \
    conda clean --all -y

ENV PATH="/opt/conda/envs/env/bin:$PATH"

CMD ["/bin/bash"]
