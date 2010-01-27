import os,sys,re
from optparse import OptionParser
options=None
args=None
usage = "usage: _increment.py -a -m -b -u -w"
parser=OptionParser(usage=usage)
parser.add_option("-a",dest="major",help="Increment the major version number")
parser.add_option("-m","--minor",dest="minor",help="Increment the minor version number")
parser.add_option("-b","--bug",dest="bug",help="Increment the bug version number")
parser.add_option("-u","--build",dest="build",help="Increment the build number")
(options,args)=parser.parse_args()
major=0;minor=1;bug=2;build=3
f=open("version","r")
content=f.read()
versions=re.split("\n",content)
for c in range(0,len(versions)): versions[c]=int(versions[c])
incmaj=False
incmin=False
if options.major:
	incmaj=True
	versions[major]+=1
	versions[minor]=0
	versions[bug]=0
if not incmaj and options.minor:
	incmin=True
	versions[minor]+=1
	versions[bug]=0
if not incmaj and not incmin and options.bug:
	versions[bug]+=1
if options.build:
	versions[build]+=1
f=open("version","w")
content="%s\n%s\n%s\n%s" % (versions[major],versions[minor],versions[bug],versions[build])
f.write(content)