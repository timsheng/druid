require 'druid/elements'

describe Druid::Elements::Element do
  let(:driver) { double('watir') }
  let(:element) { Druid::Elements::Element.new(driver) }

  context "on a druid" do
    it "should know when it is visible" do
      expect(driver).to receive(:visible?).and_return(true)
      expect(element.visible?).to be true
    end

    it "should know when it is not visible" do
      expect(driver).to receive(:visible?).and_return(false)
      expect(element.visible?).to be false
    end

    it "should know when it exists" do
      expect(driver).to receive(:exist?).and_return(true)
      expect(element.exist?).to be true
    end

    it "should know when it does not exist" do
      expect(driver).to receive(:exist?).and_return(false)
      expect(element.exist?).to be false
    end
  end
end
