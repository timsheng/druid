require 'spec_helper'
require 'druid/elements'

describe "Element with nested elements" do
  let(:we) { double 'we' }
  let(:driver) { double 'driver' }
  let(:element) { Druid::Elements::Element.new(we, driver)}

  it "should find nested links" do
    expect(driver).to receive(:link).with(:id => 'blah').and_return(driver)
    element.link_element(:id => 'blah')
  end

end
