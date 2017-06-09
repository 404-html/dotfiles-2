#/usr/bin/python3

from urllib.request import urlopen
import json
import subprocess, shlex
import sys

url=sys.argv[1]
token=sys.argv[2]

allProjects     = urlopen(url + "/api/v3/projects/all?private_token=" + token)
allProjectsDict = json.loads(allProjects.read().decode())
for thisProject in allProjectsDict: 
    try:
        thisProjectURL  = thisProject['ssh_url_to_repo']
        command     = shlex.split('echo %s' % thisProjectURL)
        resultCode  = subprocess.Popen(command)

    except Exception as e:
        print("Error on %s: %s" % (thisProjectURL, e.strerror))
