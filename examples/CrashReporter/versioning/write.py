import os,sys,re
from Foundation import NSMutableDictionary
from optparse import OptionParser
options=None
args=None
usage = "usage: _increment.py -a -m -b -u -w"
parser=OptionParser(usage=usage)
parser.add_option("-p","--plist",dest="plist",help="The info.plist file")
(options,args)=parser.parse_args()
if not options.plist: raise Exception("Plist not given (use the -p option)")
major=0;minor=1;bug=2;build=3
f=open("version","r")
content=f.read()
versions=re.split("\n",content)
plist=NSMutableDictionary.dictionaryWithContentsOfFile_(options.plist)
plist["CFBundleVersion"]=versions[build]
plist["CFBundleShortVersionString"]="%s.%s.%s"%(versions[major],versions[minor],versions[bug])
plist.writeToFile_atomically_(options.plist,1)