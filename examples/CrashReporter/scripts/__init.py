import os,sys
from optparse import OptionParser
sys.stdout.close()
sys.stderr.close()
sys.stdin.close()
options=None
args=None
usage=""
parser=OptionParser(usage=usage)
parser.add_option("-e","--execpath",dest="execpath",help="the xcodeproj.py script path (directory not path)")
(options,args)=parser.parse_args()

os.system("rm -rf sparkle/dsapub.pem")
os.system("rm -rf sparkle/dsapriv.pem")

#mk ssl keys for sparkle
os.system("openssl dsaparam 2048 < /dev/urandom > dsaparam.pem &> /dev/null")
os.system("openssl gendsa dsaparam.pem -out dsa_priv.pem &> /dev/null")
os.system("openssl dsa -in dsa_priv.pem -pubout -out dsa_pub.pem &> /dev/null")
os.system("rm -rf dsaparam.pem &> /dev/null")
os.system("mv dsa_priv.pem sparkle &> /dev/null")
os.system("mv dsa_pub.pem sparkle &> /dev/null")

#mk ssl keys for software registration
os.system("openssl dsaparam -out dsaparam.pem 512 &> /dev/null")
os.system("openssl gendsa -out privkey.pem dsaparam.pem &> /dev/null")
os.system("openssl dsa -in privkey.pem -pubout -out pubkey.pem &> /dev/null")
os.system("rm -rf dsaparam.pem &> /dev/null")
os.system("mv privkey.pem licensing &> /dev/null")
os.system("mv pubkey.pem licensing &> /dev/null")

v=open("versioning/version","w")
v.write("0\n0\n0\n0")
v.close()
os.system("rm -rf archives/*")
os.system("rm -rf release/*")
os.system("rm -rf sparkle/appcast*")
