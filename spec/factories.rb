Factory.define :page do |f|
  f.sequence(:title) { |n| n.to_s }
  f.content "foobar"
  f.keywords "foobar"
  f.published true
  f.sequence(:url_tag) { |n| n.to_s }
end
Factory.define :realtor do |f|
  f.sequence(:name) { |n| n.to_s }
  f.email "test@example.com"
  f.phone_number "123.456.7890"
  f.website 'www.google.com'
  f.sequence(:url_tag) { |n| n.to_s }
end