# coding=utf-8
'''
���ʹ������ʼ�
С���壺http://www.cnblogs.com/xiaowuyi
'''

import os
import os.path
import sys
import time


filenames=os.getcwd()+"devices.txt"

#���츽��1
if os.path.exists(filenames):
    os.remove(filenames)
os.system("adb devices > "+filenames)
ss=''
deviceList=[]
try:
    #ss='�޸İ汾�ż��������£�\n\n'
    for line in open(filenames):  
        if line.startswith('List of devices'):
            filepathhss=sys.argv[0]
        elif line.startswith('   '):
            filepathhss=sys.argv[0]
        elif line.strip()=='':
            filepathhss=sys.argv[0]
        else:
            ss=line.decode('gb2312').encode('utf-8')+'\n'
            deviceList.append(ss.split()[0])

except Exception, e:  
    print str(e)

for i in range(len(deviceList)):
    print i,deviceList[i]