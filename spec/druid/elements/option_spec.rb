require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Option do
  describe "interface" do
    it "should register as tag_name :option" do
      expect(Druid::Elements.element_class_for(:option)).to be Druid::Elements::Option
    end
  end
end

describe "interacting with the option" do
  let(:we) { double 'we' }
  let(:element) { Druid::Elements::Option.new(we) }

  it "should know if it is selected" do
    expect(we).to receive(:selected?).and_return true
    expect(element.selected?).to be true
  end

end
