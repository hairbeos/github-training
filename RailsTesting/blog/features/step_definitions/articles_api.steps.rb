Given(/^following articles$/) do |table|
  table.hashes.each do |hash|
    create(:article, hash)
  end
end

When('I get Articles via api') do
  get '/api/v1/articles'
end

Then(/^I should see the list of articles in json format$/) do
  json = JSON.parse(last_response.body)
  json.length.should == 2
end
