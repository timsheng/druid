class JavascriptPage
  include Druid

  text_field(:expression, :id => 'calculator-expression')
  text_field(:results, :id => 'calculator-result')
  button(:compute, :value => 'Compute')
end

def build_url(page)
  target = ENV['BROWSER']
  return "http://localhost:4567/#{page}" if target.nil? or target.include? 'local'
  "http://ec2-107-22-131-88.compute-1.amazonaws.com:4567/#{page}"
end

Given(/^I am on jQuery example page$/) do
  Druid.javascript_framework = :jquery
  @page = JavascriptPage.new(@driver)
  @page.navigate_to build_url("jquery.html")
end

Given(/^I am on the Prototype example page$/) do
  Druid.javascript_framework = :prototype
  @page = JavascriptPage.new(@driver)
  @page.navigate_to build_url("prototype.html")
end

When(/^I ask to compute "([^"]*)"$/) do |expression|
  @page.expression = expression
  @page.compute
end

Then(/^I should be able to wait for the answer "([^"]*)"$/) do |answer|
  @page.wait_for_ajax
  expect(@page.results).to eql answer
end

Given(/^I execute the javascript "([^"]*)"$/) do |script|
  @answer = @page.execute_script script
end

Then(/^I should get the answer "([^"]*)"$/) do |answer|
  expect(@answer).to eql answer.to_i
end
