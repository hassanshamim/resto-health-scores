require 'nokogiri'
require 'open-uri'
require 'net/http'
$remote_url = "http://health.nashville.gov/env/food/FoodScores/FoodScores.aspx?BegDate=08/1/2007&EndDate=11/12/2012"
doc = Nokogiri::HTML(open($remote_url).read)
nodes = doc.css('div#content > p')
#nodes.children[] 0, 2, 4, 6 contain relevant data
#0 = Name, 2 = Address, 4 = Date, 6 = Score
$passing_nodes = nodes.take_while{ |n| n.children.size > 3 } #failing audits have different format
  #stops at the LOW SCORES node

def create_audits(nodes)
  nodes.each do |node|
    children = node.children.map{ |s| s.text.strip }
    name = children[0]
    address = children[2]
    date = Date.strptime(children[4][/\d+\/\d+\/\d+/], '%m/%d/%Y')
    score = children[6][/\d+$/]
    resto = Restaurant.where( name: name, address: address ).first_or_create!
    Audit.create( date: date, score: score, restaurant: resto )
  end
end

#for debugging
def display_audits (nodes)
  nodes.each do |node|
    children = node.children.map{ |s| s.text.strip }
    puts children[0]
    puts children[2]
    puts children[4][/\d+\/\d+\/\d+/]
    puts children[6][/\d+$/]
  end
  nil
end
