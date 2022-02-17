#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 14:55:32 2022

@author: corvusalexei
"""
from Bio import SeqIO
import sys
with open(sys.argv[1], "r+") as handle: # Ici, il faut réouvrir myfile parce qu'il a été fermé à la fin de la boucle précédente.
	for record in SeqIO.parse(handle, "fasta"):
         cap= record.id
         if record.id != "test":
             with open(sys.argv[2], "a+") as output:
                 SeqIO.write(record, output, "fasta")