#!/bin/bash
#SBATCH -J downloadSRX
#SBATCH -p general
#SBATCH -o downloadSRA%j.txt
#SBATCH -e downloadSRA%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=tbiewerh@iu.edu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=3:00:00
#SBATCH --mem=40G


cd /N/project/tomWGS/timGeneExp/geneExpression/

for f in ./data/rawData/*.fastq #add_1 if needed
do
	read1=$f
	#read2="${read1/_1/_2}"
	#searches within read1 string for occurence of _1 and replaces them with _2.
	#Useful for fastp formatting
	out1="${read1/_1.fastq/_1.clean.fastq}"
	#out2="${read2/_2.fastq/_2.clean.fastq}"
	out1="${read1/.fastq/.clean.fastq}"

	htmlFile="${read1/.fastq/.html}"

	fastp -i $read1 -o $out1 -q 25 --html $htmlFile -w 4 &
done
wait

mv ./data/rawData/*.clean.fastq ./data/cleanData
#moves clean fastq files to a cleanData file to separate clean and raw data
