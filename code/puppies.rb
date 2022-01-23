require 'nokogiri'

#!/usr/bin/env ruby

# Build a scraper for a dog adoption website. This scraper should open the paws.html page and collect all baby female dogs on each page. The scraper
# should return the href sources for each matching dog. The DIRECTORY constant contains directory containing paws.html.
#
# Hint: You will likely want to use an HTML parser like Nokogiri and use the page's pagination to iterate each page.
#
class Puppies
  DIRECTORY = ::File.join(::File.dirname(__FILE__), '../data/paws/')

  def self.parse
    returnArray = Array.new
    readFile = ""
    counter = 1
    for i in 1..4
      File.open(DIRECTORY+(i.to_s)+".html", "r") do |file|
        readFile = file.read()
      end
      parsed_data = Nokogiri::HTML.parse(readFile)
      returnArray += getFemaleBaby(parsed_data)
    end
    return returnArray
  end

  def self.getFemaleBaby(parsed_data)
    returnArray = Array.new
    dogs = parsed_data.css("a[class='img-thumbnail']")
    for dog in dogs
      if dog.text.include?"Female" and dog.text.include?"Baby"
        returnArray.append(dog["href"])
      end
    end

    return returnArray
  end
end
