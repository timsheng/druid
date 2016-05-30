When(/^I locate the form by "(.*?)"$/) do |how|
  @element = @page.send "form_#{how}_form"
end

Then(/^I should be able to submit the form$/) do
  @element.submit
end
