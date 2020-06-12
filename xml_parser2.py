import xml.etree.ElementTree as ET
import urllib.request

url = 'http://114.70.14.158:8088/ws/v1/cluster/apps/application_1590999487217_0050'
response = urllib.request.urlopen(url).read().decode('utf-8')
import json
import base64
j = json.loads(response)
print(j)
print()
print(j['app']['elapsedTime'])
print(j.keys())
print(j['app'].keys())

