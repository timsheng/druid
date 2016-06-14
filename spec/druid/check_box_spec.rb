require 'spec_helper'

class TestDruid
  include Druid

  checkbox(:active, :id => 'is_active_id')
end

describe "check_box accessors" do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  context "when called on a page object" do
    it "should generate accessor methods" do
      expect(druid).to respond_to :check_active
      expect(druid).to respond_to :uncheck_active
      expect(druid).to respond_to :active_checked?
      expect(druid).to respond_to :active_checkbox
    end
  end

  context "implementation" do
    it "should check a check box element" do
      expect(driver).to receive_message_chain(:checkbox, :set)
      druid.check_active
    end

    it "should clear a check box element" do
      expect(driver).to receive_message_chain(:checkbox, :clear)
      druid.uncheck_active
    end

    it "should know if a check box element is selected" do
      expect(driver).to receive_message_chain(:checkbox, :set?).and_return(true)
      expect(druid.active_checked?).to be true
    end
  end
end
