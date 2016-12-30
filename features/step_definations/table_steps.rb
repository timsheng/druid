When(/^I retrieve a table element$/) do
  @element = @page.table_id_element
end

When(/^I retrieve a table element by "(.*?)"$/) do |how|
  @element = @page.send "table_#{how}_element".to_sym
end

Then(/^the data for row "(.*?)" should be "(.*?)" and "(.*?)"$/) do |row, col1, col2|
   row = (row.to_i - 1) if row.to_i > 0
   table_row = @element[row]
   expect(table_row[0].text).to eql col1
   expect(table_row[1].text).to eql col2
end

Then(/^the table should have "(.*?)" rows$/) do |number|
  expect(@element.rows).to eql number.to_i
end

Then(/^each row should contain "(.*?)"$/) do |text|
  @element.each do |row|
    expect(row.text).to include text
  end
end

Then(/^row "(.*?)" should have "(.*?)" columns$/) do |row, cols|
  expect(@element[row.to_i - 1].columns).to eql cols.to_i
end

Then(/^each column should contain "(.*?)"$/) do |text|
  row = @element[0]
  row.each do |column|
    expect(column.text).to include text
  end
end

When(/^I retrieve a table element bys "(.*?)" and "(.*?)"$/) do |param1, param2|
  @element = @page.send "table_#{param1}_#{param2}_element".to_sym
end

When(/^I retrieve a table element while the script is executing$/) do
  @element = @page.table_element(:id => 'table_id')
end

Then(/^the data for the first row should be "([^"]*)" and "([^"]*)"$/) do |col1, col2|
  expect(@element.first_row[0].text).to eql col1
  expect(@element.first_row[1].text).to eql col2
end

Then(/^the data for the last row should be "([^"]*)" and "([^"]*)"$/) do |col1, col2|
  expect(@element.last_row[0].text).to eql col1
  expect(@element.last_row[1].text).to eql col2
end

Then(/^I should see that the table exists$/) do
  expect(@page.table_id?).to be true
end

Then(/^the data for column "([^"]*)" and row "([^"]*)" should be "([^"]*)"$/) do |column, row, value|
  expect(@element[row.to_i - 1][column].text).to eql value
end

Then(/^the data for row "([^"]*)" and column "([^"]*)" should be "([^"]*)"$/) do |row, column, value|
  expect(@element[row][column].text).to eql value
end

Then(/^the data for row "([^"]*)" should be nil$/) do |row|
  expect(@element[row]).to be_nil
end

Then(/^the data for row "([^"]*)" and column "([^"]*)" should be nil$/) do |row, column|
  expect(@element[row][column]).to be_nil
end

When(/^I retrieve a table with thead element$/) do
  @element = @page.table_with_thead_id_element
end
