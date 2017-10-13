require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::TableRow do
  let(:table_cell) { double('table_cell') }
  let(:element) { double 'element' }
  let(:table_row) { Druid::Elements::TableRow.new(element) }

  describe "interface" do

    before(:each) do
      allow(element).to receive(:find_elements).and_return(element)
      allow(element).to receive(:cells).and_return(Array.new(2, Watir::TableCell))
    end

    it "should return a table cell when indexed" do
      expect(table_row[1]).to be_instance_of Druid::Elements::TableCell
    end

    it "should return the number of columns" do
      expect(table_row.columns).to eql 2
    end

    it "should iterate  over the table columns" do
      count = 0
      table_row.each{ count += 1}
      expect(count).to eql 2
    end

    it "should register with tag_name :tr" do
      expect(Druid::Elements.element_class_for(:tr)).to be Druid::Elements::TableRow
    end
  end
end
