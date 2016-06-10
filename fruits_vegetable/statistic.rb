#!/usr/bin/env ruby

if ARGV.size < 1
  puts "enter one file"
  exit 1
end


f = File.open(ARGV[0], "r")
price = Hash.new
amount = Hash.new
count = Hash.new

while str = f.gets()
  attr = str.split(",")
  date = attr[0].split(":")[-1]
  month = date.split(".")[0..1].join(".")
  
  av_price = attr[-2].to_f
  av_amount = attr[-1].to_i

  if (price[month] == nil)
    price[month] = av_price
    amount[month] = av_amount
    count[month] = 1
  else
    price[month] = price[month] + av_price
    amount[month] = amount[month] + av_amount
    count[month] = count[month] + 1
  end
end


price.each do |key, value|
  arr = Array.new  
  arr << key.to_s << (value / count[key]).to_s << amount[key].to_s << (value * amount[key]).to_s
  puts arr.join(",")
end
