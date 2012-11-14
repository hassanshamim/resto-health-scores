#as shown in https://gist.github.com/1334262
And /^I should see (.+) table$/ do |table_id, expected_table|
    #where does expected_table come from?  do I need to add a (.+?) to the end?
  html_table = table_at("##{table_id.parameterize.tableize}").to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '').gsub(/[\n\t\r]/, '').strip} }
  expected_table.diff!( html_table )
end

def table_at( selector )
  Nokogiri::HTML( page.body ).css( selector ).map do |table|
    table.css('tr').map do |tr|
      tr.css('td').map { |td| td.text }
    end
  end[0].reject(&:empty?)
end
