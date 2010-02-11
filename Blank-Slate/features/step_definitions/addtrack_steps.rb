Given /^(.*) is a registered user$/ do |name|
  user = User.first(:name => Elvis)
end

Given /^is logged in$/ do
 login_as Factory(:user)
end

When /^Elvis goes to (.*) page$/ do
  pending 
end

When /^Elvis clicks 'add track'$/ do
  pending 
end

Then /^he should see the 'add more tracks' page$/ do
  pending 
end

