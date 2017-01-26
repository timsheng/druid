require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Canvas do
  context "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Canvas.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end

  context "implementation" do
    let(:element) { double('canvas_element') }
    let(:canvas) { Druid::Elements::Canvas.new(element) }

    it "should knwo its width" do
      expect(canvas).to receive(:size).and_return('width' => 400)
      expect(canvas.width).to eql 400
    end

    it "should know its height" do
      expect(canvas).to receive(:size).and_return('height' => 100)
      expect(canvas.height).to eql 100
    end
  end
end
