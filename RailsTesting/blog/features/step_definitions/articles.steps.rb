Given(/^I have articles titled (.+)$/) do |titles|
  titles.split(', ').each do |title|
    Article.create!(title: title)
  end
end

When(/^I go to the list of articles$/) do
  visit articles_path
  # puts page
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end

Given(/^I have no articles$/) do
  Article.delete_all
end

When(/^I click link "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |name, value|
  fill_in name, with: value
end

When(/^I click "(.*?)"$/) do |button|
  click_button button
end

Then(/^I should have "(.*?)" article$/) do |count|
  Article.count.should == count.to_i
end
