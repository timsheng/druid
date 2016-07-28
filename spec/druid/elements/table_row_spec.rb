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
    let(:element) { double 'element' }
    let(:driver) { double 'driver' }
    let(:table_row) { Druid::Elements::TableRow.new(element, driver) }

    it "should return a table cell when indexed" do
      expect(element).to receive(:[]).with(1)
      expect(table_row[1]).to be_instance_of Druid::Elements::TableCell
    end

    it "should return the number of columns" do
      expect(element).to receive_message_chain(:cells, :size).and_return(3)
      expect(table_row.columns).to eql 3
    end

    it "should iterate  over the table columns" do
      expect(table_row).to receive(:columns).and_return(3)
      allow(table_row).to receive(:[])
      count = 0
      table_row.each do
        count += 1
      end
      expect(count).to eql 3
    end
  end
end
