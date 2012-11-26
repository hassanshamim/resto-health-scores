Feature: User sees the full audits list
  In order to peruse the restaurant scores
  As a user
  I want to see all restaurants scores
  # DATES are formatted as YYYY/MM/DD
  # BUT DISPLAYED AS MM/DD/YYYY

  Background:
    Given an audit with name: "Resto1", address: "123 Fake Street", score: 88, date: 1989/09/05
    Given an audit with name: "Resto2", address: "324 Dumb Avenue", score: 100, date: 2011/02/15

  Scenario: Table of all Articles
    When I am on the homepage
    And I click "All Reviews"
    Then I should be on the audits list page
    And I should see health scores table
      | Resto1 | 123 Fake Street |  88   | 09/05/1989 |
      | Resto2 | 324 Dumb Avenue |  100  | 02/15/2011 |

  @wip
  Scenario: User follows link to restaurant information
    Given I am on the audits list page
    Then I should see health scores table
      | Resto1 | 123 Fake Street |  88   | 09/05/1989 |
      | Resto2 | 324 Dumb Avenue |  100  | 02/15/2011 |
  When I click "Resto1"
  Then I should see the title "Resto1"
  And I should see "123 Fake Street"
  And I should see 1 items in the table
