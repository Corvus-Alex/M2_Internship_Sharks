python3 pycut.py reference/sequence.gb reference
python3 pythonextractor_3.0.py reference/*.gbk
python3 pycut3.py reference/*.faa
for i in reference/*.fst; do
python3 faa_maker.py ${i}
done
