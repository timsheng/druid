require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Image do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :alt].each do |t|
        identifier = Druid::Elements::Image.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  describe "interface" do
    let(:element) { 'element' }
    let(:image) { Druid::Elements::Image.new(element) }

    it "should know the image width" do
      expect(element).to receive(:width).and_return(100)
      expect(image.width).to eql 100
    end

    it "should know the image height" do
      expect(element).to receive(:height).and_return(120)
      expect(image.height).to eql 120
    end

    it "should register with tag_name :img" do
      expect(Druid::Elements.element_class_for(:img)).to be Druid::Elements::Image
    end
  end
end
