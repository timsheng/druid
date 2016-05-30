When(/^I get the text from the span$/) do
  @text = @page.span_id
end

When(/^I locate the span by "(.*?)"$/) do |how|
  @text = @page.send "span_#{how}".to_sym
end

When(/^I retrieve a span element$/) do
  @element = @page.span_id_span
end
