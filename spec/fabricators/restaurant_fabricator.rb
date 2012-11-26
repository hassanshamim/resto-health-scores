Fabricator(:restaurant) do
  name { sequence( :name ) { |i| "Resto#{i}"}}
  address { sequence( :address ){ |i| "#{i} Sequence Road" }}
end
