import sys
import os

accessionIDs = sys.argv[1]


accessionIDs = open(accessionIDs, 'r')

for i, line in enumerate(accessionIDs):
    l = line.replace('\n', '').split()
    fileNameR1 = l[0] + '_1.fastq.gz'
    fileNameR2 = l[0] + '_2.fastq.gz'
    
    newFileNameR1 = fileNameR1.replace(l[0], l[1])
    
    newFileNameR2 = fileNameR2.replace(l[0], l[1])

    print(newFileNameR1)
    print(newFileNameR2)
    call = "mv " + fileNameR1 + " " + newFileNameR1
    
    call2 = "mv " + fileNameR2 + " " + newFileNameR2 

    os.system(call)
    os.system(call2)
accessionIDs.close()


