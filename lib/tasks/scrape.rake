require 'date'
require 'nokogiri'
task :scrape => :environment do
  puts "Scraping Data... this may take a few seconds... (Or minutes at NSS)"
  start_date = ( Date.today - 14 ).strftime('%m/%d/%Y')
  end_date = ( Date.today ).strftime('%m/%d/%Y')

  remote_url = "http://health.nashville.gov/env/food/FoodScores/FoodScores.aspx?BegDate=#{start_date}&EndDate=#{end_date}"
  doc = Nokogiri::HTML(open(remote_url).read)
  nodes = doc.css('div#content > p')
  low_score_position = nodes.find_index{|node| node.inner_text.include?("Low Scores")}
  updates_position = nodes.find_index{|node| node.inner_text.include?("Updates")}

  #If there aren't any audits, all children.size will be < 4

  passing_nodes = nodes[ 0...low_score_position ].to_a
  failing_nodes = nodes[ ( low_score_position+1 )... updates_position ].to_a
  update_nodes = nodes[( (updates_position+1) ..-1)].to_a
  all_nodes = [passing_nodes, failing_nodes, update_nodes]

  all_nodes.each do |node_list|
    node_list.reject!{ |node| node.children.size == 1 }  #Removes 'No Scores available' lines
  end

  #nodes.children[] 0, 2, 4, 6 contain relevant data
  #0 = Name, 2 = Address, 4 = Date, 6 = Score
  def create_audits(nodes)
    nodes.each do |node|
      children = node.children.map{ |s| s.text.strip }
      name = children[0]
      address = children[2]
      date = Date.strptime(children[4][/\d+\/\d+\/\d+/], '%m/%d/%Y')
      score = children[6][/\d+$/].to_i
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

  if passing_nodes.empty? and failing_nodes.empty?
    puts "No scores to be added"
  else
    create_audits( passing_nodes )
    create_audits( failing_nodes )
  end

end
