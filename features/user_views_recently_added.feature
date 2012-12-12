Feature: User views the most recently added audits
  In order to view the newest Audits
  As a user
  I want to see all the audits added in the last scrape

  Background:
    Given There are 10 audits from 2 weeks ago
    And There are 5 audits from 1 week ago

  Scenario: User navigates to latest audits page from homepage
    Given I am on the homepage
    When I click "Recently Added"
    Then I should be on the latest audits page
    And I should see 5 items in the table

  Scenario: User navigates to latest audits page from audits list page
    Given I am on the audits list page
    When I click "Recently Added"
    Then I should be on the latest audits page
    And I should see 5 items in the table

  Scenario: User navigates to latest audits page from restaurants list page
    Given I am on the restaurants list page
    When I click "Recently Added"
    Then I should be on the latest audits page
    And I should see 5 items in the table

  Scenario: User views the latest page before and after new audits are added
    Given I am on the latest audits page
    Then I should see 5 items in the table
    Given There are 7 audits are added today
    When I reload the page
    Then I should see 7 items in the table

