require 'spec_helper'
require 'druid/elements'

describe Druid::Elements::SelectList do
  describe "interface" do
    let(:element) { double 'element' }
    let(:opts) { [element, element] }
    let(:select_list) { Druid::Elements::SelectList.new(element) }

    it "should return an option when indexed" do
      expect(element).to receive(:options).with(no_args).and_return(opts)
      expect(select_list[1]).to be_instance_of Druid::Elements::Option
    end

    it "should retrieve all values of select_list" do
      expect(element).to receive(:options).with(no_args).and_return(opts)
      expect(select_list.options.size).to eql 2
    end

    it "should select an element" do
      expect(element).to receive(:select).with('test')
      select_list.select('test')
    end

    it "should register with tag_name :select" do
      expect(Druid::Elements.element_class_for(:select)).to be Druid::Elements::SelectList
    end

    it "should return an array of selected options" do
      allow(element).to receive(:selected_options).and_return(opts)
      allow(element).to receive(:text).and_return(element)
      expect(select_list.selected_options).to eql opts
    end

    it "should be able to get the value for the selected options" do
      allow(element).to receive(:selected_options).and_return(opts)
      allow(element).to receive(:value).and_return(element)
      expect(select_list.selected_values).to eql opts
    end

    it "should know if it includes some value" do
      expect(element).to receive(:include?).with('blah').and_return(true)
      select_list.include?('blah')
    end

    it "should know if an option is selected" do
      expect(element).to receive(:selected?).with("blah").and_return(true)
      select_list.selected?('blah')
    end
  end
end
