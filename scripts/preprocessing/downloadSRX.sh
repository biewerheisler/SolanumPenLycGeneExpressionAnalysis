#!/bin/bash

#SBATCH -A r00290
#SBATCH -J downloadSRX
#SBATCH -p general
#SBATCH -o downloadSRA%j.txt
#SBATCH -e downloadSRA%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=tbiewerh@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=24:00:00
#SBATCH --mem=40G

module load sra-toolkit

#Param 1 = List of accessions \t name
#Param2 = Output directory
cd /N/project/tomWGS/timGeneExp/geneExpression/
outDir="./data/rawDataLycopersicoides"

set -x

while read f; do
	array=($f)
	file=${array[0]}
	name=${array[1]}
	echo $file
	echo $outDir
	fasterq-dump $file -f -b 500MB -m 500MB -v &
	

done <./data/accessionIDs/tuberID
wait



