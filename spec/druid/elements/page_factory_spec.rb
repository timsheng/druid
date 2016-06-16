require 'spec_helper'
require 'druid/page_factory'

class TestDruid
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
    @world.visit_page TestDruid do |page|
      expect(page).to be_instance_of TestDruid
    end
  end
  it "should create a new page object and execute a block" do
    expect(@world.driver).not_to receive(:goto)
    @world.on_page TestDruid do |page|
      expect(page).to be_instance_of TestDruid
    end
  end
end
