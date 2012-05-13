@admin-menu
Feature: Manage Menu Items
  In order to make CMS website
  As an admin
  I want to create and manage menu items

  Scenario: Menu Item List
    Given I have MenuItems named "Main Menu", "Left Menu"
    #And I am logged in as "admin"
    When I go to the admin list of MenuItems
    Then I should see "Main Menu"
    And I should see "Left Menu"

  Scenario: Create Valid Menu Item
    Given I have no MenuItems
    #And I am logged in as "admin"
    And I have MenuItems named "Main Menu"
    And I am on the admin list of MenuItems
    When I follow "Add Submenu"
    And I fill in "Label" with "About Us"
    And I fill in "Path" with "about-us"
    And I press "Create Menu Item"
    Then I should see "New menu item created."
    And I should see "About Us"

  Scenario: Create a Valid Child Menu Item
    Given I have MenuItems named Main Menu
    #And I am logged in as "admin"
    And I am on the admin list of MenuItems
    When I follow the add_child link for Main Menu    
    And I fill in "Label" with "About Us"
    And I fill in "Path" with "about-us"
    And I press "Create Menu Item"
    Then I should see "New menu item created."
    And I should see "About Us" 
    And I should see "Main Menu"

  Scenario: Create a Menu Item for a Page
    Given I have a page titled About Us
    And I have no MenuItems
    And I have MenuItems named Main Menu
    #And I am logged in as "admin"
    And I am on the admin list of MenuItems
    When I follow "Add Submenu"
    And I fill in "Label" with "About Us"
    And I select "about-us" from "Page"
    And I press "Create Menu Item"
    Then I should see "New menu item created"
    And I should see "About Us"

  Scenario: Delete a Menu Item
    Given I have no MenuItems
    And I have MenuItems named Company
    #And I am logged in as "admin"
    And I am on the admin list of MenuItems
    And I follow "Delete"
    Then I should not see "Company"
