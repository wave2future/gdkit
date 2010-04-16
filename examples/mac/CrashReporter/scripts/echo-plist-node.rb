#!/usr/bin/env ruby
require "rubygems"
require "plist"
file=ARGV[0]
node=ARGV[1]
plist = Plist::parse_xml(file)
if not plist
  exit(1)
end
puts plist[node.to_s]
exit(0)