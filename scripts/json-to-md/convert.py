#-*- coding: utf-8 -*-

import json
import yaml

def loadJSON(file):
    with open(file, 'r') as f:
        data = f.read().decode('utf8', 'ignore')
    return json.loads(data)

ff = open('buzzfeed.yaml', 'w+')

print(yaml.dump(loadJSON('buzzfeed.json'), ff, allow_unicode=True))

#print(json.dumps(loadJSON('buzzfeed.json')))
#print(pypandoc.convert_text(json.dumps(loadJSON('buzzfeed.json')), 'json', 'yaml'))
