Feature: User sees the full audits list
  In order to peruse the restaurant scores
  As a user
  I want to see all restaurants scores


  Scenario: Table of all Articles
  Given the following audits:
    |  name  |    address      | score |   date   |
    | resto1 | 123 fake street |  88   | 10-22-10 |
    | resto2 | 324 dumb avenue |  100  | 12-12-12 |
  When I am on the homepage
  And I click "All Reviews"
  Then I should be on the list page
  And I should see health scores table
    |  Name  |    Address      | Score |   Date   |
    | resto1 | 123 fake street |  88   | 10-22-10 |
    | resto2 | 324 dumb avenue |  100  | 12-12-12 |
