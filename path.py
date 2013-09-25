#!/usr/bin/python
#v1, v2 index of start and end Verticles (int)
#blackList List of visited verticles 
#
import copy
# matrix = [[0,1,0],[1,0,1],[0,1,0]]
matrix = [[0,1,10,0],[1,0,4,1],[10,4,0,1],[0,1,1,0]]
paths = []

def searchPath(mtx,v1,v2,blackList):
	if v1 == v2:
		paths.append(blackList)
		return 

	mtxLen = len(mtx)
	for x in xrange(mtxLen):
		checkVal = mtx[v1][x]
		if x not in blackList and checkVal > 0:
			newBlackList = copy.deepcopy(blackList)
			newBlackList.append(x)
			searchPath(mtx,x,v2,newBlackList)

def serachCheap(paths, mtx):
	pathsLen = len(paths)
	if pathsLen == 1:
		path = paths[0]
		pathLen = len(path)
		tmpSum = 0
		for y in xrange(1,pathLen):
			row = path[y-1]
			col = path[y]
			tmpSum = tmpSum + mtx[row][col]
		return (tmpSum, path)

	if pathsLen > 1:
		halfLen = pathsLen / 2
		sumLeft, pathLeft = serachCheap(paths[halfLen:],mtx)
		sumRight, pathRight = serachCheap(paths[:halfLen],mtx)
		result = 0
		if sumLeft > sumRight:
		 	result = (sumRight, pathRight)
		else:
			result = (sumLeft, pathLeft)
		return result 

def main():
	blackList = [0]
	searchPath(matrix,0,2,blackList)
	print serachCheap(paths, matrix)

if __name__ == '__main__':
	main()
	
# \xc7\xed\xe0\xe5\xf8\xfc\x20\x43\x23\x3f\x20\xd2\xee\xe3\xe4\xe0
# \xe7\xe2\xee\xed\xe8\x20\x34\x39\x35\x32\x33\x31\x36\x34\x32\x33