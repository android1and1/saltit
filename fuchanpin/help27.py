import sys
import random
if len(sys.argv) > 1:
	rangenum=sys.argv[1]
else:
	rangenum=100	
arr=[ x for x in range(int(rangenum)) ]
random.shuffle(arr)
print '(',
for i in arr:
	print i,
print ')'
