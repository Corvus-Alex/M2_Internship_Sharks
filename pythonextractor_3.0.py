#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 12 10:32:38 2022

@author: corvusalexei
"""

# extractNAfeatures.py

from Bio import SeqIO
from Bio.Seq import Seq
import sys



output=sys.argv[1]+".faa"
with open(output, 'w') as nfh:
        for rec in SeqIO.parse(sys.argv[1], "genbank"):
                if rec.features:
                        for feature in rec.features:
                            if feature.type == "CDS":
                                    if "(+)" in str(feature.location):
                                        nfh.write(">%s from %s\n%s\n" % (
                                        (feature.qualifiers["product"][0]).replace(" ", ""),
                                        rec.name,
                                        feature.location.extract(rec).seq))
                                    if "(-)" in str(feature.location):
                                        nfh.write(">%s from %s\n%s\n" % (
                                        (feature.qualifiers["product"][0]).replace(" ", ""),
                                        rec.name,
                                        feature.location.extract(rec).seq.reverse_complement()))
                          
                            if feature.type == "rRNA":
                                    if "(+)" in str(feature.location):
                                        nfh.write(">%s from %s\n%s\n" % (
                                        feature.qualifiers['product'][0],
                                        rec.name,
                                        feature.location.extract(rec).seq))
                                    if "(-)" in str(feature.location):
                                        nfh.write(">%s from %s\n%s\n" % (
                                        feature.qualifiers['product'][0],
                                        rec.name,
                                        feature.location.extract(rec).seq.reverse_complement()))