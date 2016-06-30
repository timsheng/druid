When(/^I locate the form by "(.*?)"$/) do |how|
  @element = @page.send "form_#{how}_form"
end

Then(/^I should be able to submit the form$/) do
  @element.submit
end

When(/^I locate the form using "(.*?)" and "(.*?)"$/) do |param1, param2|
  @element = @page.send "form_#{param1}_#{param2}_form"
end

When(/^I locate the form$/) do
  @element = @page.form_id_form
end
