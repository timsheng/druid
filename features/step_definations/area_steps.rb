When(/^I retrieve an area element$/) do
  @element = @page.area_id_element
end

When(/^I search for the area by "([^"]*)"$/) do |how|
  @how = how
end

Then(/^I should be able to click the area$/) do
  @page.send("area_#{@how}")
end
