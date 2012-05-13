Then /^I should have (\d+) (.+)$/ do |num, model_str|
  model_name = model_str.gsub(/\s/, '_').singularize
  klass = eval(model_name.camelize)
  klass.all.count.should be num.to_i
end

Given /^there are (\d+) (.+)$/ do |n, model_str|
  model_str = model_str.gsub(/\s/, '_').singularize
  model_sym = model_str.to_sym
  klass = eval(model_str.camelize)
  klass.transaction do
    klass.destroy_all
    n.to_i.times do |i|
      Factory(model_sym)
    end
  end
end

Then /^I should see (\d+) "([^\"]*)"$/ do |n, object|
  page.should have_selector("#{object}", :count => n.to_i)
end

Then /^I should see the pagination$/ do
  page.should have_selector("div.pagination", :count => 1)
end

Then /^I should have a (.+) with a (.+) of "([^\"]*)"$/ do |object, attribute, value|
  klass = eval(object.camelize)
  o = klass.find(:all, :conditions => "#{attribute} = '#{value}'")
  o.size.should be > 0
end

Given /^I am logged in as "(.*)"$/ do |username|
  #User is created in features/support/hooks.rb
#  setup :activate_authlogic
  visit login_path
  fill_in("Username", :with => username)
  fill_in("Password", :with => 'generic')
  click_button("Log in")

  page.should have_content('logged')
end

When /^dump the page$/ do
  save_and_open_page
end
