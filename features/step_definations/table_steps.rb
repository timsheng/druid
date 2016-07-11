When(/^I retrieve a table element$/) do
  @element = @page.table_id_element
end

When(/^I retrieve a table element by "(.*?)"$/) do |how|
  @element = @page.send "table_#{how}_element".to_sym
end

Then(/^the data for row "(.*?)" should be "(.*?)" and "(.*?)"$/) do |row, col1, col2|
   row = @element[row.to_i - 1]
   expect(row[0].text).to eql col1
   expect(row[1].text).to eql col2
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
