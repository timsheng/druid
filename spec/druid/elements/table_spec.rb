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

  describe "interface" do
    let(:element) { double('element')}
    let(:table) { Druid::Elements::Table.new(element)}

    it "should return a table row" do
      expect(element).to receive(:[]).with(1)
      expect(table[1]).to be_instance_of Druid::Elements::TableRow
    end

    it "should return the number of rows" do
      expect(element).to receive_message_chain(:rows, :size).and_return(2)
      expect(table.rows).to eql 2
    end

    # it "should iterate over the table rows" do
    #
    # end
  end
end
