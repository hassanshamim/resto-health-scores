def path_to( page_name )
  case page_name
  when /^the home\s?page$/
    '/'
  when "that restaurant's page"
    restaurant_path(@resto)
  when "the audits list page"
    '/scores'
  when "the restaurants list page"
    '/restaurant'
  when /^the sorted by "(.+)" page$/
    scores_path($1)
  when /^the latest audits page$/
    '/scores/latest'
  else
    raise "Can't find mapping from \"#{page_name}\" to a path. \n" +
    "Now, go and add a mapping in #{__FILE__}"
  end
end

def scores_path( order )
  "/scores?sort=#{order.downcase}"
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to( page_name )
end

Then /^I should be on (.+)$/ do |page_name|
  current_path = URI.parse( current_url ).path
  if current_path.respond_to? :should
    current_path.should == path_to( page_name )
  else
    assert_equal path_to( page_name ), current_path
  end
end

When /^I reload the page$/ do
  visit [ current_path, page.driver.request.env['QUERY_STRING'] ].reject(&:blank?).join('?')
end
