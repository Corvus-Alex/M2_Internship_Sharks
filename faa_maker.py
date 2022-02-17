#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 19 19:12:37 2022

@author: alexis
"""


from Bio import SeqIO
import sys
with open(sys.argv[1], "r+") as handle: # Ici, il faut réouvrir myfile parce qu'il a été fermé à la fin de la boucle précédente.
	for record in SeqIO.parse(handle, "fasta"):
         cap= record.id
         record.id = "test"
         record.description = ""
         record.seq = record.seq.replace("A", "N")
         record.seq = record.seq.replace("C", "N")
         record.seq = record.seq.replace("T", "N")
         record.seq = record.seq.replace("G", "N")
         myoutput= sys.argv[1]+ "." + cap.upper() + ".faa"
         with open(myoutput, "a+") as output:
             SeqIO.write(record, output, "fasta")