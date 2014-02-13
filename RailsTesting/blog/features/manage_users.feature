Feature: Manage User
  In order manage user detail
  As a admin
  I want edit user only when authorized

	@users
	Scenario Outline: Show edit link as admin or owner
	Given the following user records
			| username | password | admin |
			| admin    | pass     | true  |
			| user     | pass     | false |
	And I login as "<login>"/"<pass>"
	When I visit "<profile>" profile link
	Then I should <action>

	Examples:
		| login | pass | profile | action                 |
		| admin | pass | admin   | see "Edit Profile"     |
		| admin | pass | user    | see "Edit Profile"     |
		| user  | pass | user    | see "Edit Profile"     |
		| user  | pass | admin   | not see "Edit Profile" |


	Scenario: Can create user with valid info
	When I visit the signup page
	And I fill in "Username" with "admin"
	And I fill in "Password" with "pass"
	And I fill in "Retype Password" with "pass"
	And I click "Sign Up"
	Then I should see "admin"
	And Password should be encrypted
