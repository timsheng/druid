require 'spec_helper'

class TestDruid
  include Druid

  select_list(:state, :id => 'state')
end

describe "select_list accessors" do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  context "when called on a page object" do
    it "should generate accessor methods" do
      expect(druid).to respond_to :state
      expect(druid).to respond_to :state=
      expect(druid).to respond_to :state_select_list
    end
  end

  context "implementation" do
    it "should get the current item from a select list" do
      expect(driver).to receive_message_chain(:select_list, :value).and_return('OH')
      expect(druid.state).to eql 'OH'
    end

    it "should set the current item fo a select list" do
      expect(driver).to receive(:select_list).and_return driver
      expect(driver).to receive(:select).with('OH')
      druid.state = 'OH'
    end
  end
end
