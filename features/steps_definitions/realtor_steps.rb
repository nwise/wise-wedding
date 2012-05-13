Given /^I have no realtors$/ do
  Realtor.destroy_all
end

Given /^I have a realtor named (.+)$/ do |name|
  Realtor.destroy_all
  Realtor.create(:name => name)
end

And /^I open the page$/ do
  save_and_open_page
end

When /^I follow "([^\"]*)" for the Realtor "([^\"]*)"$/ do |method, url_tag|
  realtor = Realtor.find_by_name(url_tag)
  click_link("#{method}_#{realtor.id}")
end