Feature: User sees the full audits list
  In order to peruse the restaurant scores
  As a user
  I want to see all restaurants scores
  # DATES are formatted as YYYY/MM/DD
  # BUT DISPLAYED AS MM/DD/YYYY

  Scenario: Table of all Articles
    Given the following audits:
      | Name   | Address         | Score | Date       |
      | resto1 | 123 fake street | 88    | 1989/09/05 |
      | resto2 | 324 dumb avenue | 100   | 2011/02/15 |
    When I am on the homepage
    And I click "All Reviews"
    Then I should be on the list page
    And I should see health scores table
      | resto1 | 123 fake street |  88   | 09/05/1989 |
      | resto2 | 324 dumb avenue |  100  | 02/15/2011 |
