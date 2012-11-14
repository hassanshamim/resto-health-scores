Feature: User sorts the audits
  Background:
    Given the following audits:
      |  name  |    address      | score |    date    |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto3 | 832 fizz road   |  100  | 4/20/2011  |
    And I am on the list page

  Scenario: User sorts by name
    When I click "Name"
    Then I should be on the ordered by: "Name" page
    And I should see health scores table
      |  name  |    address      | score |    date    |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 4/20/2011  |

  Scenario: User sorts by address
    When I click "Address"
    Then I should be on the ordered by: "Address" page
    And I should see health scores table
      |  name  |    address      | score |    date    |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 4/20/2011  |

  Scenario: User sorts by score
    When I click "Score"
    Then I should be on the ordered by: "Score" page
    And I should see health scores table
      |  name  |    address      | score |    date    |
      | resto3 | 832 fizz road   |  100  | 4/20/2011  |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |

  Scenario: User sorts by date
    When I click "Date Reviewed"
    Then I should be on the ordered by: "Date" page
    And I should see health scores table
      |  name  |    address      | score |     date     |
      | resto2 | 324 dumb avenue |  48   | 12/12/2012 |
      | resto3 | 832 fizz road   |  100  | 4/20/2011  |
      | resto1 | 123 fake street |  88   | 10/22/2010 |
