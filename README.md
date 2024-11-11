# EDTA-docker
The ability to quickly set up an EDTA environment for analysis, which is more complete than the official image (without additional configuration)

# Usage

* Pull Image
```
docker pull ghcr.io/kozora/edta-docker:main
```
* Usage:

```
docker run ghcr.io/kozora/edta-docker:main EDTA.pl --genome genome.fa [other parameters]
```

* Testing:

```
docker run -it --rm ghcr.io/kozora/edta-docker:main bash
cd test
perl ../EDTA.pl --genome genome.fa --cds genome.cds.fa --curatedlib ../database/rice7.0.0.liban --exclude genome.exclude.bed --overwrite 1 --sensitive 1 --anno 1 --threads 10
```
