Feature: User uses pagination
  As a user
  In order to view the lists cleanly
  I want to move forward and back through the data by page

  Background:
    Given 40 audits

  Scenario: user clicks next and previous on audits page
    Given I am on the audits list page
    Then I should see 30 items in the table
    When I click "Next"
    Then I should see 10 items in the table
    When I click "Prev"
    Then I should be on the audits list page
    And I should see 30 items in the table

  Scenario: user clicks first and last on audits page
    Given I am on the audits list page
    Then I should see 30 items in the table
    When I click "Last"
    Then I should see 10 items in the table
    When I click "First"
    Then I should be on the audits list page
    And I should see 30 items in the table

  Scenario: user clicks numbers on audits page
    Given I am on the audits list page
    Then I should see 30 items in the table
    When I click "2"
    Then I should see 10 items in the table
    When I click "1"
    Then I should be on the audits list page
    And I should see 30 items in the table

    Scenario: user clicks next and previous on restaurants page
      Given I am on the restaurants list page
      Then I should see 25 items in the table
      When I click "Next"
      Then I should see 15 items in the table
      When I click "Prev"
      Then I should be on the restaurants list page
      And I should see 25 items in the table

    Scenario: user clicks first and last on restaurants page
      Given I am on the restaurants list page
      Then I should see 25 items in the table
      When I click "Last"
      Then I should see 15 items in the table
      When I click "First"
      Then I should be on the restaurants list page
      And I should see 25 items in the table

    Scenario: user clicks numbers on restaurants page
      Given I am on the restaurants list page
      Then I should see 25 items in the table
      When I click "2"
      Then I should see 15 items in the table
      When I click "1"
      Then I should be on the restaurants list page
      And I should see 25 items in the table

