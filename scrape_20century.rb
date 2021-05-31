require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

url = 'https://www.cglib.org/20th-century/'
htmltext = URI.open(url)

response = Nokogiri::HTML(htmltext)

nodeset = response.xpath("//*[contains(@class, 'entry-content')]//a")
links = nodeset.map {|element| element["href"]}.compact
links.delete_at(0)
p links
composers = nodeset.map{|element| element.text}.compact
composers.delete_at(0)
p composers

p composers.class

CSV.open("20thcentury_composers.csv", "w") do |csv|
  csv << ['name', 'era', 'url']
    composers.length.times do |i|
    #composers.each do |array|
      temp = composers[i].split(".")
      p temp
      if temp[1]
        csv << [temp[1].strip+" "+ temp[0], "Contemporary", links[i]]
      else
        csv << [temp[0], "Contemporary", links[i]]
      end
  end
end
