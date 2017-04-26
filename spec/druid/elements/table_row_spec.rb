require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TableRow do
  describe "interface" do
    let(:element) { double 'element' }
    let(:table_row) { Druid::Elements::TableRow.new(element) }

    it "should return a table cell when indexed" do
      allow(table_row).to receive(:columns).and_return(2)
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

    it "should register with tag_name :tr" do
      expect(Druid::Elements.element_class_for(:tr)).to be Druid::Elements::TableRow
    end
  end
end
