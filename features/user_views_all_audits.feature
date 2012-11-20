Feature: User sees the full audits list
  In order to peruse the restaurant scores
  As a user
  I want to see all restaurants scores
  # DATES are formatted as YYYY/MM/DD
  # BUT DISPLAYED AS MM/DD/YYYY

  Scenario: Table of all Articles
    Given an audit with name: "Resto1", address: "123 Fake Street", score: 88, date: 1989/09/05
    Given an audit with name: "Resto2", address: "324 Dumb Avenue", score: 100, date: 2011/02/15
    When I am on the homepage
    And I click "All Reviews"
    Then I should be on the list page
    And I should see health scores table
      | Resto1 | 123 Fake Street |  88   | 09/05/1989 |
      | Resto2 | 324 Dumb Avenue |  100  | 02/15/2011 |
