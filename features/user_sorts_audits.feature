Feature: User sorts the audits
    In order to organize the data
    As a user
    I want to sort by specific attributes
  Background:
    Given an audit with name: "Resto1", address: "123 Fake Street", score: 88, date: 2010/10/22
    Given an audit with name: "Resto2", address: "324 Dumb Avenue", score: 48, date: 2012/12/12
    Given an audit with name: "Resto3", address: "832 Fizz Road", score: 100, date: 2011/03/20


  Scenario: User sorts by name twice
    Given I am on the audits list page
    When I click "Name"
    Then I should be on the audits list page
    And I should see health scores table
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
    When I click "Name"
    Then I should see health scores table
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |

  Scenario: User sorts by score twice
    Given I am on the audits list page
    When I click "Score"
    Then I should be on the audits list page
    And I should see health scores table
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
    When I click "Score"
    Then I should see health scores table
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |

  Scenario: User sorts by date twice
    Given I am on the audits list page
    When I click "Date"
    Then I should be on the audits list page
    And I should see health scores table
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
    When I click "Date"
    Then I should see health scores table
      | Resto1 | 123 Fake Street |  88   | 10/22/2010 |
      | Resto3 | 832 Fizz Road   |  100  | 03/20/2011 |
      | Resto2 | 324 Dumb Avenue |  48   | 12/12/2012 |
