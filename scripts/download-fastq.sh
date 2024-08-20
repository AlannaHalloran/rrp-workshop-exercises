#!/bin/bash

# Set Some Useful Settings to handle the pesky bugs
set -euo pipefail

# Define URLs and file paths. This way if link changes your neck will be pain free
FASTQ_R1="SRR11518889_1.fastq.gz"
FASTQ_R2="SRR11518889_2.fastq.gz"
FASTQ_URL="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889"

DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}


#### R1 FILE ####
echo "Downloading the R1 file"

## Download 
# -O: keep file same from the internet
# -S: don't print status bar or errors
# -S: but actually I do want to print errors
curl -sSO ${FASTQ_URL}/${FASTQ_R1}

# Move the file
mv ${FASTQ_R1} ${DATA_DIR}/

echo "The R1 file has this many lines:"

#Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l



#### R2 FILE ####
 echo "Downloading the R2 file"


## Download 
curl -sSO ${FASTQ_URL}/${FASTQ_R2}

# Move the file
mv ${FASTQ_R2} ${DATA_DIR}/

echo "The R2 file has this many lines:"

#Print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l