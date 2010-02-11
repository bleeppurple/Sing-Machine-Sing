Feature: Access add track page
  In order Security when access content
  As a administrator
  I want to be able to restrict access through login

Scenario: Manage Users 
  Given the following user records
  |name	|password	|admin	|
  |Elvis	|graceland	|false	|
  |admin	|admin		|true	|
  And I try to log on with the following credentials Elvis with password graceland
  Then I should see "User Home Page" if correct or "Invalid Login"
