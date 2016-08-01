require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Heading do
  describe "When mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Heading.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
