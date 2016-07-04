require 'druid/elements'

describe Druid::Elements::Element do
  let(:we) { double('we') }
  let(:element) { Druid::Elements::Element.new(we) }

  context "when handling unknown requests" do
    it "should delegate to the driver element" do
      expect(we).to receive(:do_this)
      element.do_this
    end
  end

  context "when building the identifiers" do
    it "should build xpath when finding elements by name were not supported" do
      ['table', 'span', 'div', 'td', 'li', 'ol', 'ul'].each do |tag|
        how = {:tag_name => tag, :name => 'blah'}
        result = Druid::Elements::Element.identifier_for how
        expect(result[:xpath]).to eql ".//#{tag}[@name='blah']"
      end
    end
  end

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

    it "should be clickable" do
      expect(we).to receive(:click)
      element.click
    end

    it "should be able to block until it is present" do
      expect(we).to receive(:wait_until_present).with(10)
      element.when_present(10)
    end

    it "should be able to block until it is visible" do
      expect(Watir::Wait).to receive(:until).with(10, "Element was not visible in 10 seconds")
      element.when_visible(10)
    end

    it "should be able to block until it is not visible" do
      expect(Watir::Wait).to receive(:while).with(10, "Element still visible after 10 seconds")
      element.when_not_visible(10)
    end

    it "should be able to block until a user define event fires true" do
      expect(Watir::Wait).to receive(:until).with(10, "Element blah")
      element.wait_until(10, "Element blah") {}
    end

    it "should send keys to the element" do
      expect(we).to receive(:send_keys).with([:control, 'a'])
      element.send_keys([:control, 'a'])
    end

    it "should clear its' contents" do
      expect(we).to receive(:clear)
      element.clear
    end

    it "should be double clickable" do
      expect(we).to receive(:double_click)
      element.double_click
    end

    it "should be right clickable" do
      expect(we).to receive(:right_click)
      element.right_click
    end
  end
end
