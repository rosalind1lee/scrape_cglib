require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'

csv_text = File.read(Rails.root.join("lib", "csvs", "all_composers.csv"))
#csv_text = "all_composers.csv"
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
p csv[0]
csv.each do |row|
  url = row["url"]
  p url
  htmltext = URI.open(url)
  response = Nokogiri::HTML(htmltext)
  nodeset = response.xpath("//*[contains(@class, 'entry-title-link')]//a")
  p nodeset
end

