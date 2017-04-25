require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::Table do
  describe "interface" do
    let(:element) { double('element')}
    let(:table) { Druid::Elements::Table.new(element) }

    it "should return a table row" do
      expect(element).to receive(:[]).with(1)
      expect(table[1]).to be_instance_of Druid::Elements::TableRow
    end

    it "should return the number of rows" do
      expect(element).to receive_message_chain(:rows, :size).and_return(2)
      expect(table.rows).to eql 2
    end

    it "should iterate over the table rows" do
      allow(element).to receive(:[])
      expect(table).to receive(:rows).and_return(2)
      count = 0
      table.each do
        count += 1
      end
      expect(count).to eql 2
    end

    it "should return the first row" do
      expect(element).to receive(:[]).with(0).and_return(element)
      expect(table.first_row).to be_instance_of Druid::Elements::TableRow
    end

    it "should return the last row" do
      expect(element).to receive(:[]).with(-1).and_return(element)
      expect(table.last_row).to be_instance_of Druid::Elements::TableRow
    end

    it "should register with tag_name :table" do
      expect(Druid::Elements.element_class_for(:table)).to be Druid::Elements::Table
    end
  end
end
