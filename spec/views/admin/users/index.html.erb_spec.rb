require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_users/index.html.erb" do
  include Admin::UsersHelper

  before(:each) do
    assigns[:admin_users] = [
      stub_model(Admin::User,
        :username => "value for username",
        :email_address => "value for email_address",
        :password => "value for password"
      ),
      stub_model(Admin::User,
        :username => "value for username",
        :email_address => "value for email_address",
        :password => "value for password"
      )
    ]
  end

  it "renders a list of admin_users" do
    render
    response.should have_tag("tr>td", "value for username".to_s, 2)
    response.should have_tag("tr>td", "value for email_address".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
  end
end
