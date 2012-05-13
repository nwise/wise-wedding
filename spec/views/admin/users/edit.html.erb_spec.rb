require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

describe "/admin_users/edit.html.erb" do
  include Admin::UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(Admin::User,
      :new_record? => false,
      :username => "value for username",
      :email_address => "value for email_address",
      :password => "value for password"
    )
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_username[name=?]', "user[username]")
      with_tag('input#user_email_address[name=?]', "user[email_address]")
      with_tag('input#user_password[name=?]', "user[password]")
    end
  end
end
