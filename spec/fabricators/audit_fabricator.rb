Fabricator(:audit) do
  date { sequence(:date) { |i|  Date.parse( "#{i}-10-10" ) } }
  score { sequence( :score, 50 ) }
  restaurant do 
    Fabricate(:restaurant) do
      name { sequence(:name) { |i| "Resto#{i}" } }
      address { sequence( :address ) { |i| "#{i} Sequence Road" } }
    end
  end
end
