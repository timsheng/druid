When(/^I retrieve the audio element$/) do
  @element = @page.audio_id_element
end

When(/^I search for the audio element by "([^"]*)"$/) do |how|
  @element = @page.send "audio_#{how}_element"
end

When(/^I search for the audio element by "([^"]*)" and "([^"]*)"$/) do |param1, param2|
  @element = @page.send "audio_#{param1}_#{param2}_element"
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
