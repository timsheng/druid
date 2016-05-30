When(/^I get the image element$/) do
  @element = @page.image_id_image
end

Then(/^the image should be "(.*?)" pixels wide$/) do |width|
  expect(@element.width.to_s).to eql width
end

Then(/^the image should be "(.*?)" pixels tall$/) do |height|
  expect(@element.height.to_s).to eql height
end

When(/^I get the image element by "(.*?)"$/) do |how|
  @element = @page.send "image_#{how}_image".to_sym
end
