Given /^the following user records?$/ do |table|
  table.hashes.each do |hash|
    User.first(:name => hash)
  end
end
Given /^I try to log on with the following credentials (.*) with password (.*)$/ do |username, password|
  visit ("/login")
  fill_in "login[username]", :with => username
  fill_in "login[password]", :with => password
  click_button "Log in"
end

Then /^I should see "User Home Page" if correct$/ do |userHomePage|
end