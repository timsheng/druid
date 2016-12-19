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

      it "should know it's current url" do
        expect(driver).to receive(:url).and_return("www.baidu.com")
        expect(druid.current_url).to eql "www.baidu.com"
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

      it "should retrieve the text from prompt popup" do
        allow(driver).to receive_message_chain(:alert, :exists?).and_return(true)
        allow(driver).to receive_message_chain(:alert, :text).and_return('I am an prompt')
        allow(driver).to receive_message_chain(:alert, :set).with("blah")
        expect(driver).to receive_message_chain(:alert, :ok)
        msg = druid.prompt("blah") do
        end
        expect(msg).to eql "I am an prompt"
      end

      it "should switch to a new window with a given title" do
        expect(driver).to receive(:window).with(:title => "My Title").and_return(driver)
        expect(driver).to receive(:use)
        druid.attach_to_window(:title => "My Title")
      end

      it "should switch to a new window with a given index" do
        expect(driver).to receive(:window).with(:index => 1).and_return(driver)
        expect(driver).to receive(:use)
        druid.attach_to_window(:index => 1)
      end

      it "should switch to a new window witha given url" do
        expect(driver).to receive(:window).with(:url => /success\.html/).and_return(driver)
        expect(driver).to receive(:use)
        druid.attach_to_window(:url => "success.html")
      end

      it "should refresh the page contents" do
        expect(driver).to receive(:refresh)
        druid.refresh
      end

      it "should know how to go back" do
        expect(driver).to receive(:back)
        druid.back
      end

      it "should know how to go forward" do
        expect(driver).to receive(:forward)
        druid.forward
      end

      it "should try a second time after sleeping when attach to window fails" do
        expect(driver).to receive(:window).once.and_return(driver)
        expect(driver).to receive(:use).once.and_throw "error"
        expect(driver).to receive(:window).and_return(driver)
        expect(driver).to receive(:use)
        druid.attach_to_window(:value => 'tim')
      end

      it "should call intialize_page if it exists" do
        class CallbackPage
          include Druid
          attr_reader :initialize_page

          def initialize_page
            @initialize_page = true
          end
        end

        page = CallbackPage.new(driver)
        expect(page.initialize_page).to be true
      end

      it "should convert a modal popup to a window" do
        expect(driver).to receive(:execute_script)
        druid.modal_dialog {}
      end

      it "should know how to clear all of the cookies from the browser" do
        expect(driver).to receive(:cookies).and_return(driver)
        expect(driver).to receive(:clear)
        druid.clear_cookies
      end

      it "should be able to save a screenshot" do
        expect(driver).to receive_message_chain(:screenshot,:save)
        druid.save_screenshot('tim.png')
      end

    end
  end



end
