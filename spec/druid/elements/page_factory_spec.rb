require 'spec_helper'
require 'druid/page_factory'

class FactoryTestDruid
  include Druid
  page_url "http://www.baidu.com"
end

class TestWorld
  include Druid::PageFactory

  attr_accessor :driver
end

describe Druid::PageFactory do
  before(:each) do
    @world = TestWorld.new
    @world.driver = mock_driver
  end

  it "should create and visit a new page" do
    expect(@world.driver).to receive(:goto)
    @world.visit_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end
  it "should create a new page object and execute a block" do
    expect(@world.driver).not_to receive(:goto)
    @world.on_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end
end
