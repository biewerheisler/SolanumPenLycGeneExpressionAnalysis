#!/bin/bash
#SBATCH -J star_map
#SBATCH -p general
#SBATCH -o star_map_%j.txt
#SBATCH -e star_map_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gibsomat@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=5:00:00
#SBATCH --mem=50G
cd /N/project/tomWGS/timGeneExp/geneExpression/
module load star

for f in ./data/cleanData/*clean.fastq
do
	read1=$f
	#read2="${read1/_1/_2}"
	outPrefix="${read1/.clean.fastq/}"
	#replace suffix with nothing, removing it
	echo $outPrefix
	tmp=$(basename $outPrefix)
	echo $tmp
	STAR --genomeDir ./data/genome/sLyc4.0Index --readFilesIn $read1 --outFileNamePrefix $outPrefix --outSAMtype BAM SortedByCoordinate --runThreadN 12 --outTmpDir /N/project/tomWGS/$tmp
done
wait
mv ./data/cleanData/*.bam ./data/mappedReads
