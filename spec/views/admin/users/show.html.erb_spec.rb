require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_users/show.html.erb" do
  include Admin::UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(Admin::User,
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ username/)
    response.should have_text(/value\ for\ email_address/)
    response.should have_text(/value\ for\ password/)
  end
end
