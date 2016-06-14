require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TableRow do
  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :name, :xpath, :index].each do |t|
        identifier = Druid::Elements::TableRow.identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end
  end
  describe "interface" do
    let(:element) { double 'element'}
    let(:table_row) { Druid::Elements::TableRow.new(element) }

    it "should return a table cell when indexed" do
      expect(element).to receive(:[]).with(1)
      expect(table_row[1]).to be_instance_of Druid::Elements::TableCell
    end
  end
end