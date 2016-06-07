When(/^I get the text from the span$/) do
  @text = @page.span_id
end

When(/^I locate the span by "(.*?)"$/) do |how|
  @text = @page.send "span_#{how}".to_sym
end

When(/^I retrieve a span element$/) do
  @element = @page.span_id_span
end

When(/^I search for the span by "(.*?)" and "(.*?)"$/) do |param1, param2|
  @text = @page.send "span_#{param1}_#{param2}".to_sym
end
