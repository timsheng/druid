require 'spec_helper'

class TestDruid
  include Druid

  text_field(:first_name, :id => 'first_name')
end

describe "text_field" do
  let(:driver) { mock_driver}
  let(:druid) { TestDruid.new(driver)}

  context "when called on a page object" do
    it "should generate accessor methods" do
      expect(druid).to respond_to(:first_name)
      expect(druid).to respond_to(:first_name=)
      expect(druid).to respond_to(:first_name_text_field)
    end
  end

  context "implementation" do
    it "should get the text from the text field element" do
      expect(driver).to receive_message_chain(:text_field, :value).and_return('Kim')
      expect(druid.first_name).to eql 'Kim'
    end

    it "should set some text on a text field element" do
      expect(driver).to receive_message_chain(:text_field, :set).with('Kim')
      druid.first_name = 'Kim'
    end

    it "should retreive text field element" do
      expect(driver).to receive(:text_field)
      druid.first_name_text_field
    end
  end

end
