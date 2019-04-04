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
      expect(we).to receive(:present?).and_return(true)
      expect(element.present?).to be true
    end

    it "should know when it is not visible" do
      expect(we).to receive(:present?).and_return(false)
      expect(element.present?).to be false
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
      expect(we).to receive(:present?).and_return(false)
      expect(we).to receive(:present?).and_return(true)
      expect(element.check_visible).to be true
    end

    it "should check if the element is present" do
      # simulate Active Support's Object#present? being included
      allow_any_instance_of(Object).to receive(:present?)

      expect(we).to receive(:present?)
      element.present?
    end

    it "should check if the element exists" do
      expect(we).to receive(:exists?).and_return(false)
      expect(we).to receive(:exists?).and_return(true)
      expect(element.check_exist).to be true
    end

    it "should be able to block until it is present" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not present in 10 seconds")
      element.when_present(10)
    end

    it "should return the element when it is present" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not present in 10 seconds")
      new_element = element.when_present(10)
      expect(new_element).to eql element
    end

    it "should use the overriden wait when set" do
      Druid.default_element_wait = 20
      allow(we).to receive(:wait_until).with(timeout: 20, message: "Element not present in 20 seconds")
      element.when_present
    end

    it "should be able to block until it is visible" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element not present in 10 seconds")
      allow(we).to receive(:displayed?).and_return(true)
      new_element = element.when_visible(10)
      expect(new_element).to eql element
    end

    it "should be able to block until it is not visible" do
      allow(we).to receive(:wait_while).with(timeout: 10, message: "Element still visible after 10 seconds")
      allow(we).to receive(:displayed?).and_return(false)
      element.when_not_visible(10)
    end

    it "should be able to block until a user define event fires true" do
      allow(we).to receive(:wait_until).with(timeout: 10, message: "Element blah")
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

  context 'walking the dom' do
    let(:found) { double('found').as_null_object }

    before do
      allow(found).to receive(:tag_name).and_return(:span)
    end

    it 'should find the parent object' do
      expect(we).to receive(:parent).and_return(found)
      object = element.parent
      expect(object).to be_a(Druid::Elements::Span)
      expect(object.tag_name).to eql :span
    end

    it 'should find the proceeding sibling' do
      expect(we).to receive(:preceding_sibling).and_return(found)
      object = element.preceding_sibling
      expect(object).to be_a(Druid::Elements::Span)
      expect(object.tag_name).to eql :span
    end

    it 'should find the following sibling' do
      expect(we).to receive(:following_sibling).and_return(found)
      object = element.following_sibling
      expect(object).to be_a(Druid::Elements::Span)
      expect(object.tag_name).to eql :span
    end

    it 'should find all of its siblings' do
      expect(we).to receive(:siblings).and_return([found, found])
      results = element.siblings
      expect(results.size).to eql 2
      expect(results[0]).to be_a(Druid::Elements::Span)
      expect(results[1]).to be_a(Druid::Elements::Span)
    end

    it 'should find all of its children' do
      expect(we).to receive(:children).and_return([found, found])
      results = element.children
      expect(results.size).to eql 2
      expect(results[0]).to be_a(Druid::Elements::Span)
      expect(results[1]).to be_a(Druid::Elements::Span)
    end

    it 'should find all of the preceding siblings' do
      expect(we).to receive(:preceding_siblings).and_return([found, found])
      results = element.preceding_siblings
      expect(results.size).to eql 2
      expect(results[0]).to be_a(Druid::Elements::Span)
      expect(results[1]).to be_a(Druid::Elements::Span)
    end

    it 'should find all of the following siblings' do
      expect(we).to receive(:following_siblings).and_return([found, found])
      results = element.following_siblings
      expect(results.size).to eql 2
      expect(results[0]).to be_a(Druid::Elements::Span)
      expect(results[1]).to be_a(Druid::Elements::Span)
    end
  end
end
