Feature: User sorts the audits
    In order to organize the data
    As a user
    I want to sort by specific attributes
  Background:
    Given the following audits:
      |  name  |    address      | score |    date    |
      | resto2 | 324 dumb avenue |  48   | 2012/12/12 |
      | resto1 | 123 fake street |  88   | 2010/10/22 |
      | resto3 | 832 fizz road   |  100  | 2011/04/20 |
    And I am on the list page
    Then I should see health scores table
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |

  Scenario: User sorts by name twice
    When I click "Name"
    Then I should be on the list page
    And I should see health scores table
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
    When I click "Name"
    Then I should see health scores table
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |

  Scenario: User sorts by score twice
    When I click "Score"
    Then I should be on the list page
    And I should see health scores table
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
    When I click "Score"
    Then I should see health scores table
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |

  Scenario: User sorts by date twice
    When I click "Date"
    Then I should be on the list page
    And I should see health scores table
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
    When I click "Date"
    Then I should see health scores table
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto3 | 832 fizz road   |  100  | 04/20/2011 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
