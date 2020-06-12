'''
arg1: input log file
'''

'''
TODO: among two logs in grep, select first
find similar cases in other application
'''

import re
import sys
f = open(sys.argv[1], 'r')

dic={}
key = ''
for i in f.readlines():
	if len(re.findall('\t\w.*', i)):
		if '=' in i:
			s = i.split('=')
			k, v = s[0], s[1]
			dic[key][k[2:]] = v[:-1]
		else:
			key = re.findall('\w.*\w',i)[0]
			dic[key] = {}
import json
print json.dumps([dic], ensure_ascii=False, indent=2)
