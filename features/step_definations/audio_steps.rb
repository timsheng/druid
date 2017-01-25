When(/^I search for the audio element by "([^"]*)"$/) do |how|
  @element = @avpage.send "audio_#{how}_element"
end

When(/^I search for the audio element by "([^"]*)" and "([^"]*)"$/) do |param1, param2|
  @element = @avpage.send "audio_#{param1}_#{param2}_element"
end

Then(/^I should know the audio is not autoplay$/) do
  expect(@element).not_to be_autoplay
end

Then(/^I should know that the controls are displayed$/) do
  expect(@element).to have_controls
end

Then(/^I should know that the audio is paused$/) do
  expect(@element).to be_paused
end

Then(/^I should know that the duration is greater than (\d+) seconds$/) do |duration|
  expect(@element.duration).to be > duration.to_f
end

Then(/^I should know that its volume is (\d+)$/) do |volume|
  expect(@element.volume).to eql volume.to_i
end

Given(/^I am on the audio video page$/) do
  @avpage = visit AudioVideoPage
end

When(/^I retrieve the audio element from the page$/) do
  @element = @avpage.audio_id_element
end

Then(/^I should know that it has not ended$/) do
  expect(@element).not_to be_ended
end

Then(/^I should know that it is not seeking$/) do
  expect(@element).not_to be_seeking
end

Then(/^I should know that it is not in a loop$/) do
  expect(@element).not_to be_loop
end

Then(/^I should know that it is muted$/) do
  expect(@element).not_to be_muted
end
