#!/usr/bin/env ruby
require "rubygems"
require "plist"
file=ARGV[0]
node=ARGV[1]
value=ARGV[2]
plist = Plist::parse_xml(file)
if not plist
  puts "File #{file} was not found. Not doing anything."
  exit(0)
end
plist[node.to_s]=value
plist.save_plist(file)