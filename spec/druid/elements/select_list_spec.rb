require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::SelectList do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath].each do |t|
        identifier = Druid::Elements::SelectList.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
end
