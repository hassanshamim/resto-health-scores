class Scraper
  def self.get_latest( weeks )
    days = weeks.to_i * 7
    start_date = ( Date.today - days ).strftime('%m/%d/%Y')
    end_date = ( Date.today ).strftime('%m/%d/%Y')
    remote_url = "http://health.nashville.gov/env/food/FoodScores/FoodScores.aspx?BegDate=#{start_date}&EndDate=#{end_date}"
    scrape( remote_url )
  end

  def self.get_all
    end_date = ( Date.today ).strftime('%m/%d/%Y')
    remote_url = "http://health.nashville.gov/env/food/FoodScores/FoodScores.aspx?BegDate=08/1/2007&EndDate=#{end_date}"
    scrape( remote_url )
  end

  def self.scrape( url )
    doc = Nokogiri::HTML( open(url).read )
    nodes = doc.css( 'div#content > p' )
    low_score_position = nodes.find_index{|node| node.inner_text.include?("Low Scores")}
    updates_position = nodes.find_index{|node| node.inner_text.include?("Updates")}

    passing_nodes = nodes[ 0...low_score_position ].to_a
    failing_nodes = nodes[ ( low_score_position+1 )... updates_position ].to_a
    update_nodes = nodes[( (updates_position+1) ..-1)].to_a
    all_nodes = [passing_nodes, failing_nodes, update_nodes]

    all_nodes.each do |node_list|
      node_list.reject!{ |node| node.children.size == 1 }  #Removes 'No Scores available' lines
    end

    if passing_nodes.empty? and failing_nodes.empty?
      puts "No scores to be added"
    else
      create_audits( passing_nodes, failing_nodes )
    end
  end

  def self.create_audits( *audit_categories )
    audit_categories.each do |nodes|
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
  end
end

namespace :scrape do
  desc "Scrapes latest n weeks of restaurant health scores and adds them to the database (default: 1)"
  task :latest, [:weeks] => :environment do |t, args|
    require 'open-uri'
    puts "Scraping Data... this may take a few seconds"
    args.with_defaults( :weeks => 1 )
    Scraper.get_latest( args.weeks )
  end

  desc "Scrapes all health scores and adds them to the database"
  task :all => :environment do
    require 'open-uri'
    puts "Scraping Data... this may take a minute or two"
    Scraper.get_all
  end
end
