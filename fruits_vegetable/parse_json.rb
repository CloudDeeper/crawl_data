#!/usr/bin/env ruby

require 'json'


def parse_json(in_file, collection)
  fout = File.open("result/#{collection}", "a")

  f = File.open(in_file, "r")
  str = f.gets()

  arr = JSON.parse(str)
  arr.each do |hash|
    str_arr = Array.new
    hash.each do |key, value|
      str_arr << value
    end
    
    fout.write(str_arr.join(",") + "\n")
  end
  
  f.close
  `rm #{in_file}`
end



for year in 101..105
  for month in 1..12
    for day in 1..31
      
      month_str = month.to_s
      day_str = day.to_s
      
      if (month_str.size < 2)
        month_str = "0" + month_str
      end

      if (day_str.size < 2)
        day_str = "0" + day_str
      end

      day = "#{year}.#{month_str}.#{day_str}"
      collection = "#{year}.#{month_str}"
       
      `./crawl.sh #{day}`
      parse_json(day, collection)
      puts day

    end
  end
end
