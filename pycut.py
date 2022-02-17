#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 10:22:19 2022

@author: corvusalexei
"""


from Bio import SeqIO
import sys

for rec in SeqIO.parse(sys.argv[1], "genbank"):
    SeqIO.write([rec], open(sys.argv[2] + "/" + rec.id + ".gbk", "w"), "genbank")