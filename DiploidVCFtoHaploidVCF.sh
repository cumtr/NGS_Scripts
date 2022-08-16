#! /bin/bash

# Awk command to transform a diploid phased VCF to a Haploid VCF, with two times the same allele in each haplotype
# The outputed VCF should have twice the number of Individuals in the first VCF.
# 
# To use this script, Run : 
# ./SplitHaplotypes.bash InVCF OutVCF

InVCF=$1
InVCF=$2

awk -vOFS="\t" -F"\t" '{
  ## just print the header lines
  if(/^##/){
    print;
  }
  ## Add extra collums to the header line 
  if(/^#C/){
    sampleNum = NF - 9
    for(i=1; i<=sampleNum; i++){
      ## get the fields
		ID=$(9+i);
		$(8+i) = $(9+i)"_1\t"$(9+i)"_2"
    }
    print;

  }
  else{    
    ## The number of samples will be the extra number of fields 
    ## in addition to the default VCF 9
    sampleNum = NF - 9
    ## Fix each sample
    for(i=1; i<=sampleNum; i++){
      ## get the genotype
      num=split($(9+i), fields,"|");
      ## genotype
      $(9+i) = fields[1]"|"fields[1]"\t"fields[2]"|"fields[2]
      }
    }
    print;
  }' ${InVCF} > ${OutVCF}
