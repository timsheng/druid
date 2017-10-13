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

    it "should know when it is not equal to another" do
      expect(element).not_to eq 'not an element'
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

    it "should be clickable" do
      expect(we).to receive(:click)
      element.click
    end

    it "should check if the element is visible" do
      msg = "Element not visible in 5 seconds"
      expect(we).to receive(:wait_until).with(timeout: 5, message: msg).and_return(element)
      expect(element.check_visible).to be_truthy
    end

    it "should check if the element exists" do
      expect(we).to receive(:wait_until).with(timeout: 5).and_return(element)
      expect(element.check_exist).to be_truthy
    end

    it "should be able to block until it is present" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not visible in 10 seconds")
      element.when_present(10)
    end

    it "should use the overriden wait when set" do
      Druid.default_element_wait = 20
      allow(we).to receive(:wait_until).with(timeout: 20, message: "Element not visible in 20 seconds")
      element.when_present
    end

    it "should be able to block until it is visible" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not present in 10 seconds")
      expect(we).to receive(:wait_until).with(timeout: 10, message: "Element not visible in 10 seconds")
      element.when_visible(10)
    end

    it "should be able to block until it is not visible" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not visible in 10 seconds")
      expect(we).to receive(:wait_while).with(timeout: 10, message: "Element still visible after 10 seconds")
      element.when_not_visible(10)
    end

    it "should be able to block until a user define event fires true" do
      allow(we).to receive(:wait_until).with(10, "Element blah")
      element.wait_until(10, "Element blah") {true}
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

    it "should get element's style" do
      expect(we).to receive(:style).with('class').and_return('tim')
      expect(element.style('class')).to eql "tim"
    end

    it "should know if an element is focused" do
      expect(we).to receive(:focused?).and_return(true)
      expect(element.focused?).to be true
    end

    it "should know if an element is not focuesd" do
      expect(we).to receive(:focused?).and_return(false)
      expect(element.focused?).to_not be true
    end

    it "should be able to fire event" do
      expect(we).to receive(:fire_event).with('onclick')
      element.fire_event('onclick')
    end

    it "should be able to focus element" do
      expect(we).to receive(:focus)
      element.focus
    end

    it "should know if the element is disabled" do
      expect(we).to receive(:enabled?).and_return(false)
      expect(element).to be_disabled
    end

    it "should be able to flash element" do
      expect(we).to receive(:flash)
      element.flash
    end

    it "should return the outer html" do
      expect(we).to receive(:outer_html).and_return("<div>blah</div>")
      element.outer_html
    end

    it "should return the inner html" do
      expect(we).to receive(:inner_html).and_return("blah")
      element.inner_html
    end

    it "should know if it is stale" do
      expect(we).to receive(:stale?).and_return(false)
      expect(element.stale?).to be false
    end
  end
end
