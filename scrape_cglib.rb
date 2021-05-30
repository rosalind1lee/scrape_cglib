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
p response