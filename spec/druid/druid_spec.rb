require "spec_helper"

class TestDruid
  include Druid
end

describe Druid do
  let(:driver) { mock_driver }
  let(:druid) { TestDruid.new(driver) }

  context "setting values on the Druid module" do
    it "should set the javascript framework" do
      expect(Druid::JavascriptFrameworkFacade).to receive(:framework=)
      Druid.javascript_framework = :foo
    end

    it "should add the javascript framework" do
      expect(Druid::JavascriptFrameworkFacade).to receive(:add_framework)
      Druid.add_framework(:foo, :bar)
    end

    it "should set a default page wait value" do
      Druid.default_page_wait = 20
      wait = Druid.instance_variable_get("@page_wait")
      expect(wait).to eql 20
    end

    it "should provide the default page wait value" do
      Druid.instance_variable_set("@page_wait", 10)
      expect(Druid.default_page_wait).to eql 10
    end

    it "should default the page wait value to 30" do
      Druid.instance_variable_set("@page_wait", nil)
      expect(Druid.default_page_wait).to eql 30
    end

    it "should set the default element wait value" do
      Druid.default_element_wait = 20
      wait = Druid.instance_variable_get("@element_wait")
      expect(wait).to eql 20
    end

    it "should provide the default element wait value" do
      Druid.instance_variable_set("@element_wait", 10)
      expect(Druid.default_element_wait).to eql 10
    end

    it "should default the element wait to 5" do
      Druid.instance_variable_set("@element_wait", nil)
      expect(Druid.default_element_wait).to eql 5
    end
  end

  context "setting values on the Druid class instance" do
    it "should set the params value" do
      TestDruid.params = {:some => :value}
      params = TestDruid.instance_variable_get("@params")
      expect(params[:some]).to eql :value
    end

    it "should provide the params value" do
      TestDruid.instance_variable_set("@params", {:value => :updated})
      expect(TestDruid.params[:value]).to eql :updated
    end

    it "should default the params to an empty hash" do
      TestDruid.instance_variable_set("@params", nil)
      expect(TestDruid.params).to eql Hash.new
    end
  end

  context "when created with a watir browser" do
    it "should include the Druid module" do
      expect(druid).to be_kind_of Druid
    end
  end

  context "when created with an object we do not understand" do
    it "should throw an error" do
      expect {
        TestDruid.new("blah")
      }.to raise_error 'expect Watir::Browser or Watir::HTMLElement'
    end
  end

  context "when sent a missing method" do

    it "should respond to it if the @root_element exists and responds" do
      expect(druid).not_to respond_to :bar
      expect(druid).not_to respond_to :baz
      class Foo; def bar; :bar_called; end; private; def baz; end; end
      druid.instance_variable_set(:@root_element, Foo.new)
      expect(druid).to respond_to :bar
      expect(druid).not_to respond_to :baz
      expect(druid.bar).to eq :bar_called
    end
  end

  describe "page level functionality" do
    context "when using PageObject" do

      it "should display the page text" do
        # expect(driver).to receive(:element).and_return(driver)
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
        expect(driver).to receive(:wait_until).with(timeout: 5, message: "too long")
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

      it "should wait document load completely" do
        expect(driver).to receive(:wait)
        druid.wait
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
          attr_reader :initialize_page_called

          def initialize_page
            @initialize_page_called = true
          end
        end

        page = CallbackPage.new(driver)
        expect(page.initialize_page_called).to be true
      end

      it "should call initialize_accessors if it exists" do
        class CallbackPage
          include Druid
          attr_reader :initialize_accessors_called

          def initialize_accessors
            @initialize_accessors_called = true
          end
        end

        @page = CallbackPage.new(driver)
        expect(@page.initialize_accessors_called).to be true
      end

      it "should call initialize_accessors before initialize_page if both exist" do
        class CallbackPage
          include Druid
          attr_reader :initialize_page, :initialize_accessors

          def initialize_page
            @initialize_page = Time.now
          end

          def initialize_accessors
            @initialize_accessors = Time.now
          end
        end

        @page = CallbackPage.new(driver)
        expect(@page.initialize_accessors.usec).to be <= @page.initialize_page.usec
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

      it "should use the overriden timeout value when set" do
        Druid.default_page_wait = 10
        expect(driver).to receive(:wait_until).with(timeout: 10, message: nil)
        druid.wait_until
      end

      it "should wait until there are no pending ajax requests" do
        expect(Druid::JavascriptFrameworkFacade).to receive(:pending_requests).and_return('pending requests')
        expect(driver).to receive(:execute_script).with('pending requests').and_return(0)
        druid.wait_for_ajax
      end

      it "should execute javascript on the browser" do
        expect(driver).to receive(:execute_script).and_return("abc")
        expect(druid.execute_script("333")).to eql "abc"
      end

      it "should know which element has focus" do
        expect(driver).to receive(:execute_script).and_return(driver)
        expect(driver).to receive(:tag_name).twice.and_return(:input)
        expect(driver).to receive(:type).and_return(:submit)
        expect(druid.element_with_focus.class).to eql Druid::Elements::Button
      end
    end
  end

end
