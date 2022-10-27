# NGS_Scripts

Directory with various usefull scripts to transform, format, and analyses data.


### Informations about the scripts 

Most of them are straitforward and have all the info inside to understand hopw to run them.

***`Fasta2Fastq.perl`*** Convert a fasta to a fastq file.

***`DiploidVCFtoHaploidVCF.sh`*** Convert a phased diplod fasta with *n* individuals into a haploid vcf with *2n* individuals.

***`CountNs.c`*** is a short program to count Ns in a fasta file.

It should be compile before running using `gcc -O3 -Wall CountNs.c -o CountNs`

to run it, run `CountNs < Yourfasta.fasta`


