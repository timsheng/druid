require 'spec_helper'

class Container
  include Druid
end

class SectionsPage
  include Druid

  page_section(:container, Container, :id => 'blah')
  page_sections(:containers, Container, :class => 'foo')
end

describe Druid::Accessors do
  context "when using watir" do
    let(:driver) { mock_driver }
    let(:druid) { SectionsPage.new(driver) }

    it "it should find a page section" do
      expect(driver).to receive(:element).with(:id => 'blah').and_return(driver)
      section = druid.container
      expect(section).to be_instance_of Container
    end

    it "it should find page sections" do
      expect(driver).to receive(:elements).with(:class => 'foo').and_return([driver, driver])
      sections = druid.containers
      expect(sections).to be_instance_of Druid::SectionCollection
      sections.each do |section|
        expect(section).to be_instance_of Container
      end
    end
  end

  describe Druid::SectionCollection do
    ContainedItem = Struct.new(:type, :name)
    let(:section_collection) do
      contained_items = [ContainedItem.new(:sandwich, :reuben), ContainedItem.new(:soup, :lobstar_bisque), ContainedItem.new(:sandwich, :dagwood)]
      Druid::SectionCollection[*contained_items]
    end

    it "should inherit from Array" do
      expect(Druid::SectionCollection.superclass).to eq Array
    end

    it "should have functioning array methods" do
      expect(section_collection.methods).to include *Array.instance_methods
      expect(section_collection.last.type).to eq :sandwich
    end

    it "should be indexed to the sections" do
      expect(section_collection[0]).to be_an_instance_of ContainedItem
      expect(section_collection[-1]).to be_an_instance_of ContainedItem
    end

    it "should be able to iterate over the sections" do
      section_collection.each do |section|
        expect(section).to be_an_instance_of ContainedItem
      end
    end

    it "should find a section by one of its values" do
      expect(section_collection.find_by(name: :dagwood).name).to eq :dagwood
    end

    it "should find all sections matching a value" do
      expect(section_collection.select_by(type: :sandwich).map(&:type)).to eq [:sandwich, :sandwich]
    end
  end
end
