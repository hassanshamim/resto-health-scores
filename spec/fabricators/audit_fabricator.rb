Fabricator(:audit) do
  transient :weeks_old
  date { sequence(:date) { |i|  Date.parse( "#{i}-10-10" ) } }
  score { sequence( :score, 50 ) }
  created_at { |attrs| attrs[:weeks_old].nil? ? Time.now : attrs[:weeks_old].weeks.ago }


  restaurant do 
    Fabricate(:restaurant) do
      name { sequence(:name) { |i| "Resto#{i}" } }
      address { sequence( :address ) { |i| "#{i} Sequence Road" } }
    end
  end
end
