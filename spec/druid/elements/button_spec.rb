require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Button do
  context "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :value, :xpath, :src, :alt].each do |t|
        identifier = Druid::Elements::Button.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
