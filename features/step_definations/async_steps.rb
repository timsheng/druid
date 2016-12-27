def success

end

Then(/^I should be able to wait until it is present$/) do
  @element.when_present do
    success
  end
end

Then(/^I should be able to wait until it is visible$/) do
  @element.when_visible do
    success
  end
end

Then(/^I should be able to wait until it is not visible$/) do
  begin
    @element.when_not_visible do
      fail
    end
  rescue
    success
  end
end

Then(/^I should be able to wait until a block returns true$/) do
  @element.wait_until do
    @element.visible?
  end
end

class AsyncPage
  include Druid

  button(:target, :value => 'Target')
  button(:hide, :value => 'Hide Button')
  button(:unhide, :value => 'Unhide Button')
  button(:create_button, :value => "Create Button")
  button(:remove_button, :value => "Remove Button")
  button(:created_button, :value => "New Button")
end

Given(/^I am on the async elements page$/) do
  @page = AsyncPage.new(@driver)
  @page.navigate_to(UrlHelper.async)
end

When(/^I make the button invisible$/) do
  @page.hide
  sleep 2
end

Then(/^I should be able to click it when it becomes visible$/) do
  @page.unhide
  @page.target_element.when_visible do
    @page.target
  end
end

Then(/^I should be able to wait until the button becomes invisible$/) do
  @page.hide
  @page.target_element.when_not_visible do
    expect(@page.target_element.attribute("block")).to eql "none"
  end
end

When(/^I add a button a few seconds from now$/) do
  @page.create_button
end

When(/^I remove a button a few seconds from now$/) do
  @page.created_button_element.when_present
  @page.remove_button
end

Then(/^I should not be able to find the button$/) do
  @page.created_button_element.when_not_present
  expect(@page.created_button_element.exist?).to be false
end
