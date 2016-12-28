require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Area do
  context "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::Area.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
