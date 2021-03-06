

mkdir ~/biopipe/data

start=0
range_width=100000

for i in {1..3}
do 

finish=$((range_width*i))
python ~/biopipe/split.py $start $finish

done

for i in {1..10}
do

snakemake --use-conda --config n_sim=$i
python ~/biopipe/script_benchmark.py
rm -fr ~/biopipe/results/
rm -fr ~/biopipe/benchmarks/

#How to let Snakefile run index_bwa rule
#Removing rule's products

#mkdir ~/data_ref/trash
#mv ~/data_ref/human_g1k_v37.* ~/data_ref/trash/
#mv ~/data_ref/trash/human_g1k_v37.fasta ~/data_ref/
#rm -fr ~/data_ref/trash/


done

rm -fr ~/biopipe/data/
