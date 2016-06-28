require "spec_helper"

class TestDruid
  include Druid
end

describe Druid do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  context "when created with a watir-webdriver browser" do
    it "should include the Druid module" do
      expect(druid).to be_kind_of Druid
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

      it "should display the page text" do
        expect(driver).to receive(:text).and_return("driver text")
        expect(druid.text).to eql "driver text"
      end

      it "should display the html of the page" do
        expect(driver).to receive(:html).and_return("<html>Some Sample HTML</html>")
        expect(druid.html).to eql "<html>Some Sample HTML</html>"
      end

      it "should display the title of the page" do
        expect(driver).to receive(:title).and_return("I am the title of a page")
        expect(druid.title).to eql "I am the title of a page"
      end

      it "should be able to navigate to a page" do
        expect(driver).to receive(:goto).with("www.baidu.com")
        druid.navigate_to("www.baidu.com")
      end

      it "should wait until a block returns true" do
        expect(driver).to receive(:wait_until).with(5, "too long")
        druid.wait_until(5, "too long")
      end

      it "should retrieve the text from alert popup" do
        allow(driver).to receive_message_chain(:alert, :exists?).and_return(true)
        allow(driver).to receive_message_chain(:alert, :text).and_return('I am an alert')
        expect(driver).to receive_message_chain(:alert, :ok)
        msg = druid.alert do
        end
        expect(msg).to eql 'I am an alert'
      end

      it "should retrieve the text from confirm popup" do
        allow(driver).to receive_message_chain(:alert, :exists?).and_return(true)
        allow(driver).to receive_message_chain(:alert, :text).and_return('I am an confirm')
        expect(driver).to receive_message_chain(:alert, :ok)
        msg = druid.confirm(true) do
        end
        expect(msg).to eql 'I am an confirm'
      end

      it "should override prompt popup behavior" do
        expect(driver).to receive(:execute_script).twice
        druid.prompt("blah") do
        end
      end
    end
  end



end
