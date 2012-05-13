Then /^I should receive an email notification$/ do
  unread_emails_for('nathanwise@gmail.com').size.should == parse_email_count(1) 
  open_email('nathanwise@gmail.com')
  current_email.should have_subject(/Contact Us Form/)
end

def current_email_address
  CornerstoneCms::Application.config.contact_recipient
end

Then /^I should not receive an email notification$/ do
  unread_emails_for(current_email_address).size.should == 0
end
