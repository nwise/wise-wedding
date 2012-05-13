Given /^I have (a page|pages) titled (.+)$/ do |x, pages|  
  pages.split(', ').each do |page|
    Page.create!(:title => page, :content => "foo#{page}", :published => true)
  end
end

Given /^I have no pages$/ do
  Page.destroy_all
end

When /^I follow "([^\"]*)" for the Page "([^\"]*)"$/ do |method, url_tag|
  page = Page.find_by_url_tag(url_tag)  
  click_link("#{method}_#{page.id}")
end
