Feature: User views full restaurant list
  In order to peruse the restaurants scores
  As a user
  I want to see all restaurants with an audit

  Background:
    Given the following restaurant:
      | name    | Resto1                |
      | address | 123 Fake Street |
      And that restaurant has the following audits:
      | Score |      Date       |
      |   95    |  2010/02/03 |
      |   99    | 2012/11/21  |
      |   97    | 2011/04/23  |
    Given an audit with name: "Resto2", address: "324 Dumb Avenue", score: 100, date: 2011/02/15
    Then I should see 4 audits in the database
    And I should see 2 restaurants in the database

  Scenario: User views restaurant list
    Given I am on the restaurants list page
    Then I should see restaurants table
      | Resto1 | 123 Fake Street     | 11/21/2012 |
      | Resto2 | 324 Dumb Avenue | 02/15/2011 |

  Scenario: User follows link to restaurant page
    Given I am on the restaurants list page
    And I click "Resto1"
    Then I should see audits table
      |  99  |  11/21/2012  |
      |  97  |  04/23/2011  |
      |  95  |  02/03/2010  |
    And I should see the title "Resto1"
    And I should see "123 Fake Street"
