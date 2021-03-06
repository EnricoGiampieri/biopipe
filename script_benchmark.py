import pandas as pd  
import pylab as plt
import os
import re

#benchmark_{name}_subset_{sample}_n_sim_{n_sim}_cputype_{cpu_type}_thrs_{thrs}_ncpu{n_cpu}.txt


list_of_df = []
for file in os.listdir():
    if file=="Tabellone.csv":
        df = pd.read_csv(file, sep='\t')
        list_of_df.append(df)
    
list_of_benchmark = []
for file in os.listdir('./'+'benchmarks'):
    if file.startswith("benchmark_") and file.endswith(".txt"):
        list_of_benchmark.append(file) 
        
for benchmark in list_of_benchmark:
    df = pd.read_csv('./benchmarks/'+benchmark, sep='\t')
    regex = "benchmark_(\w+)_ref_(\w+)_n_sim_(\w+)_cputype_(\w+)_thrs_(\w+)_ncpu_(\w+).txt"
    info = re.findall(regex, benchmark)[0]
    print(info)    
    df['rule'] = info[0]
    if info[1]!="null":
        df['Reference subject'] = info[1]
    df['n_sim'] = info[2]
    df['cpu_type'] = info[3]
    df['threads'] = info[4]
    df['#cpu'] = info[5]
    list_of_df.append(df)
x = pd.concat(list_of_df)
x.to_csv("Tabellone.csv",sep='\t',index = False)
y = pd.read_csv("Tabellone.csv",sep='\t')
y = y.sort_values(['n_sim'],ascending=True)
y.to_csv("Tabellone.csv",sep='\t',index = False)
# %%
