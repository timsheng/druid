require 'druid/elements'

describe Druid::Elements::Element do
  let(:we) { double('we') }
  let(:element) { Druid::Elements::Element.new(we) }

  context "on a druid" do
    it "should know when it is visible" do
      expect(we).to receive(:visible?).and_return(true)
      expect(element.visible?).to be true
    end

    it "should know when it is not visible" do
      expect(we).to receive(:visible?).and_return(false)
      expect(element.visible?).to be false
    end

    it "should know when it exists" do
      expect(we).to receive(:exist?).and_return(true)
      expect(element.exist?).to be true
    end

    it "should know when it does not exist" do
      expect(we).to receive(:exist?).and_return(false)
      expect(element.exist?).to be false
    end

    it "should be able to return the text contained in the element" do
      expect(we).to receive(:text).and_return("my text")
      expect(element.text).to eql "my text"
    end

    it "should know when it is equal to another" do
      expect(we).to receive(:==).and_return(true)
      expect(element == element).to be true
    end

    it "should return its tag name" do
      expect(we).to receive(:tag_name).and_return('h1')
      expect(element.tag_name).to eql 'h1'
    end

    it "should know its value" do
      expect(we).to receive(:value).and_return('value')
      expect(element.value).to eql 'value'
    end

    it "should know how to retrieve the value of an attribute" do
      expect(we).to receive(:attribute_value).with('class').and_return('tim')
      expect(element.attribute('class')).to eql 'tim'
    end
  end
end
