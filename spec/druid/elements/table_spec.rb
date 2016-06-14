require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Table do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :name, :index, :xpath].each do |t|
        identifier = Druid::Elements::Table.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
