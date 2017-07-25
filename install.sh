
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod ugo+x Miniconda3-latest-Linux-x86_64.sh 
bash ./Miniconda3-latest-Linux-x86_64.sh -b
source ~/.bashrc 
PATH=~/miniconda3/bin:$PATH
export PATH
conda update conda -y
pip install -U psutil
pip install -U snakemake
pip install -U PyYAML
pip install matplotlib
conda config --add channels bioconda
mkdir ~/data_ref
scp /mnt/avoton/biofisici/data_snakemake/human_g1k_v37.fasta.gz ~/data_ref/
scp /mnt/avoton/biofisici/data_snakemake/SRR1611178_1.fastq.gz ~/data_ref/
scp /mnt/avoton/biofisici/data_snakemake/SRR1611178_2.fastq.gz ~/data_ref/
gunzip ~/data_ref/*.gz
