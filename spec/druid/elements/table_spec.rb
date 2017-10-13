require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Table do
  describe "interface" do
    let(:element) { double('element')}

    before(:each) do
      allow(element).to receive(:rows).and_return(Array.new(2, Watir::TableRow))
    end

    it "should register with tag_name :table" do
      expect(Druid::Elements.element_class_for(:table)).to eql Druid::Elements::Table
    end

    context "for sub methods" do

      let(:table) { Druid::Elements::Table.new(element) }

      it "should return a table row" do
        expect(table[1]).to be_instance_of Druid::Elements::TableRow
      end

      it "should return the number of rows" do
        expect(table.rows).to eql 2
      end

      it "should iterate over the table rows" do
        count = 0
        table.each do
          count += 1
        end
        expect(count).to eql 2
      end

      it "should return the first row" do
        expect(table.first_row).to be_instance_of Druid::Elements::TableRow
      end

      it "should return the last row" do
        expect(table.last_row).to be_instance_of Druid::Elements::TableRow
      end

    end

  end
end
