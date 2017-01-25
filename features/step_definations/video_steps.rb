When(/^I retrieve the video element$/) do
  @element = @avpage.video_id_element
end

When(/^I search for the video element by "([^"]*)"$/) do |how|
  @element = @avpage.send "video_#{how}_element"
end

When(/^I search for the video element by "([^"]*)" and "([^"]*)"$/) do |param1, param2|
  @element = @avpage.send "video_#{param1}_#{param2}_element"
end

Then(/^I should know the video is not autoplay$/) do
  expect(@element).not_to be_autoplay
end

Then(/^I should know that the video is paused$/) do
  expect(@element).to be_paused
end

Then(/^I should know that its height is (\d+) pixels$/) do |height|
  @element.height.should == height.to_i
end

Then(/^I should knot what its width is (\d+) pixels$/) do |width|
  @element.width.should == width.to_i
end
