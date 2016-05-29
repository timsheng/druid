When(/^I retrieve a table element$/) do
  @element = @page.table_id_table
end

When(/^I retrieve a table element by "(.*?)"$/) do |how|
  @element = @page.send "table_#{how}_table".to_sym
end

Then(/^the data for row "(.*?)" should be "(.*?)" and "(.*?)"$/) do |row, col1, col2|
   row = @element[row.to_i - 1]
   expect(row[0].text).to eql col1
   expect(row[1].text).to eql col2
end
