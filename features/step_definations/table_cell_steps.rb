When(/^I retrieve the data from the table cell$/) do
  @cell_text = @page.cell_id
end

Then(/^the cell data should be '(.*?)'$/) do |expected_text|
  expect(@cell_text).to eql expected_text
end

When(/^I locate the table cell by "(.*?)"$/) do |how|
  @cell_text = @page.send "cell_#{how}".to_sym
end

When(/^I retrieve table cell$/) do
  @element = @page.cell_id_cell
end
