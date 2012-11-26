#as shown in https://gist.github.com/1334262
And /^I should see ([a-zA-z\s]*) table$/ do |table_id, expected_table|
  html_table = table_at("##{table_id.parameterize.tableize}").to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '').gsub(/[\n\t\r]/, '').strip} }
  expected_table.diff!( html_table )
end

Then /^I should see (\d*) items in the table$/ do | expected_number |
  actual_number = page.all( :css, "tbody tr").size
  actual_number.should == expected_number.to_i
end

def table_at( selector )
  Nokogiri::HTML( page.body ).css( selector ).map do |table|
    table.css('tr').map do |tr|
      tr.css('td').map { |td| td.text }
    end
  end[0].reject(&:empty?)
end