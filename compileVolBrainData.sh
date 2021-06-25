#!/bin/bash
echo .................................. Compiling Data ............................................
ls -1 | grep csv >> list ## look for all the files that have csv
echo processing $(cat list | wc -l) files
while read f ; do echo $f ; done < list
cat list | head -1 >> first
while read f ; do echo $f ; cat $f | awk NR==1 >> results.ssv ; done < first
## while read f ; do echo $f ; cat $f | awk NR==2 >> results.ssv ; done < list
while read f ; do echo $f `cat $f | awk NR==2` >> results.ssv ; done < list
echo ......................................... DONE ..............................................
