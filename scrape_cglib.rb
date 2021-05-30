require 'nokogiri'
require 'open-uri'
require 'pry'
#require 'uri'
#require 'net/http'

#doc = Nokogiri::HTML(open("https://www.cglib.org/composers"))
#binding.pry

url = 'https://www.cglib.org/composers'
#p url
#doc = Nokogiri::HTML(open(url).read)
htmltext = URI.open(url)
#p htmltext

response = Nokogiri::HTML(htmltext)
#p response.xpath("//a[text()='#{link_text}']/@href").to_s
#p response

#nodeset = response.xpath("//*[contains(@class, 'ddmcc')]//a/@href")
nodeset = response.xpath("//*[contains(@class, 'ddmcc')]//a")
links = nodeset.map {|element| element["href"]}.compact
p links
composers = nodeset.map{|element| element.text}.compact
p composers