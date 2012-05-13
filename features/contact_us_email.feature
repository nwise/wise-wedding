# @email
# Feature: Contact Emails
#     In order to contact the site admin
#     As a visitor
#     I want to fill out the contact us form with valid information
# 
#   Scenario: Fill out the contact-us form with valid information
#     Given I am on the contact us form
#     When I fill in "Email" with "nwise@wrladv.com"
#     And I fill in "First Name" with "Jon"
#     And I fill in "Last Name" with "Doe"
#     And I fill in "Address" with "4470 Dressler Rd"
#     And I fill in "City" with "Canton"
#     And I select "Ohio" from "State"
#     And I fill in "Zip" with "44718"
#     And I fill in "Phone" with "330.493.8749"
#     And I fill in "Email" with "nwise@wrladv.com"
#     And I fill in "Company" with "WRL"
#     And I press "Send"
#     Then I should see "Thank you for your interest."
#     And I should receive an email notification
# 
#   Scenario: Fill out the contact-us form with invalid email address
#     Given I am on the contact us form
#     When I fill in "Email" with ""
#     And I fill in "First Name" with "Jon"
#     And I fill in "Last Name" with "Doe"
#     And I fill in "Address" with "4470 Dressler Rd"
#     And I fill in "City" with "Canton"
#     And I select "Ohio" from "State"
#     And I fill in "Zip" with "44718"
#     And I fill in "Phone" with "330.493.8749"    
#     And I fill in "Company" with "WRL"
#     And I press "Send"
#     Then I should see "Email address can't be blank"
#     And I should not receive an email notification
