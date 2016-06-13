require 'spec_helper'

class TestDruid
  include Druid

  link(:google_search, :text => 'Google Search')
end

describe "link" do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  context "when called on a page object" do
    it "should generate accessor methods" do
      expect(druid).to respond_to(:google_search)
      expect(druid).to respond_to(:google_search_no_wait)
      expect(druid).to respond_to(:google_search_link)
    end
  end

  context "implementation" do
    it "should select a link" do
      expect(driver).to receive_message_chain(:link, :click)
      druid.google_search
    end

    it "should select a link and not wait" do
      expect(driver).to receive_message_chain(:link, :click_no_wait)
      druid.google_search_no_wait
    end

    it "should retreive a link element" do
      expect(driver).to receive(:link)
      druid.google_search_link
    end
  end
end
