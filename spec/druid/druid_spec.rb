require "spec_helper"

class TestDruid
  include Druid
end

describe Druid do
  let(:driver){mock_driver}
  let(:druid){TestDruid.new driver}

  context "when created with a watir-webdriver browser" do
    it "should include the Druid module" do
      expect(druid).to be_kind_of Druid
    end
  end

  describe "page level functionality" do
    context "when using Druid" do
      it "should display the page text" do
        expect(druid).to receive(:text).and_return("browser text")
        expect(druid.text).to eql "browser text"
      end

      it "should display the html of the page" do
        expect(druid).to receive(:html).and_return("<html>Some Sample HTML</html>")
        expect(druid.html).to eql "<html>Some Sample HTML</html>"
      end

      it "should display the title of the page" do
        expect(druid).to receive(:title).and_return("I am the title of a page")
        expect(druid.title).to eql "I am the title of a page"
      end
    end
  end



end
