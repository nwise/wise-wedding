Given /^I have MenuItems named (.+)$/ do |menu_items|
  menu_items.split(', ').each do |menu_item|
    m = MenuItem.create!(:label => menu_item, :url => "/#{menu_item.underscore}", :parent_id => nil)
    m.update_attributes(:parent_id => nil)
  end
end

Given /^I have no MenuItems$/ do
  MenuItem.destroy_all
end

When /^I follow the (.+) link for (.+)$/ do |link, item|  
  link = "#{MenuItem.find_by_label(item).id}_#{link}"
  click_link(link)
end

Then /^I should see "([^\"]*)" on the page$/ do |arg1|
  save_and_open_page
end
