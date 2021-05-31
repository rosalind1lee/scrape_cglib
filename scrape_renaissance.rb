require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

url = 'https://www.cglib.org/renaissance/'
htmltext = URI.open(url)

response = Nokogiri::HTML(htmltext)

nodeset = response.xpath("//*[contains(@class, 'entry-content')]//a")
links = nodeset.map {|element| element["href"]}.compact
links.delete_at(0)
p links
composers = nodeset.map{|element| element.text}.compact
composers.delete_at(0)
p composers

#CSV.open("renaissance_composers.csv", "wb") do |csv|
#  composers.each do |row|
#    csv << row.to_s
#  end
#end

p composers.class

CSV.open("renaissance_composers.csv", "w") do |csv|
  csv << ['name', 'era', 'url']
    #composers.each do |array|
    composers.length.times do |i|
      temp = composers[i].split(".")
      p temp
      csv << [temp[1].strip+" "+ temp[0], "Renaissance",links[i]]
  end
end

#CSV.open("new_films.csv", "w") do |csv|
#  csv << headers
#  films_info.each do |movie|
#    csv << movie
#  end
#end