Feature: Manage Articles
	In order to make a blog
	As an author
	I want to create and manage articles

	Scenario: Articles list
	    Given I have articles titled Pizza, Coffee
	    When I go to the list of articles
	    Then I should see "Pizza"
	    And I should see "Coffee"

	Scenario: Create article
	    Given I have no articles
	    When I go to the list of articles
	    When I click link "New Article"
	    And I fill in "Title" with "PATAHA"
	    And I fill in "Content" with "Impossible"
	    And I click "Create"
	    Then I should see "PATAHA"
	    And I should have "1" article