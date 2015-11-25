import random
arr=[ x for x in range(100) ]
random.shuffle(arr)
print '(',
for i in arr:
	print i,
print ')'
