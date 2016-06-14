require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::CheckBox do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::CheckBox.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
