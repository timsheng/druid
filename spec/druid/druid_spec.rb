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



end
