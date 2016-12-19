class JavascriptPage
  include Druid

  text_field(:expression, :id => 'calculator-expression')
  text_field(:results, :id => 'calculator-result')
  button(:compute, :value => 'Compute')
end

Given(/^I am on jQuery example page$/) do
  Druid.javascript_framework = :jquery
  @page = JavascriptPage.new(@driver)
  @page.navigate_to "http://localhost:4567/jquery.html"
end

Given(/^I am on the Prototype example page$/) do
  Druid.javascript_framework = :prototype
  @page = JavascriptPage.new(@driver)
  @page.navigate_to "http://localhost:4567/prototype.html"
end

When(/^I ask to compute "([^"]*)"$/) do |expression|
  @page.expression = expression
  @page.compute
end

Then(/^I should be able to wait for the answer "([^"]*)"$/) do |answer|
  @page.wait_for_ajax
  expect(@page.results).to eql answer
end
