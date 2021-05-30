require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

url = 'https://www.cglib.org/modern/'
htmltext = URI.open(url)

response = Nokogiri::HTML(htmltext)

nodeset = response.xpath("//*[contains(@class, 'entry-content')]//a")
links = nodeset.map {|element| element["href"]}.compact
p links
composers = nodeset.map{|element| element.text}.compact
composers.delete_at(0)
p composers

p composers.class

CSV.open("modern_composers.csv", "w") do |csv|
  csv << ['name', 'era']
    composers.each do |array|
      temp = array.split(".")
      p temp
      if temp[1]
        csv << [temp[1].strip+" "+ temp[0], "Contemporary"]
      else
        csv << [temp[0], "Contemporary"]
      end
  end
end
