Feature: Articles API
  In order to request API
  As a user
  I want features

  @api
  Scenario: Get all articles
    Given following articles
		| title       | content                         |
		| best movies | this is the list of best movies |
		| music       | this is the list of music       |
    When I get Articles via api
    Then I should see the list of articles in json format
  
  
  

  
