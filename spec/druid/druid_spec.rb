require "spec_helper"

class TestDruid
  include Druid
end

describe Druid do

  context "when created with a watir-webdriver browser" do
    it "should include the Druid module" do
      @browser = Watir::Browser.new :ff
      druid = TestDruid.new(@browser)
      expect(druid).to be_kind_of Druid
      @browser.close
    end
  end

  context "when created with an object we do not understand" do
    it "should throw an error" do
      expect {
        TestDruid.new("blah")
      }.to raise_error 'expect Watir::Browser'
    end
  end

  describe "page level functionality" do
    context "when using PageObject" do
      let(:driver) { mock_driver }

      it "should display the page text" do
        expect(driver).to receive(:text).and_return("driver text")
        druid = TestDruid.new(driver)
        expect(druid.text).to eql "driver text"
      end

      it "should be able to navigate to a page" do
        expect(driver).to receive(:goto).with("www.baidu.com")
        druid = TestDruid.new(driver)
        druid.navigate_to("www.baidu.com")
      end
    end
  end



end
