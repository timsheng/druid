require 'spec_helper'
require 'druid/page_factory'

class FactoryTestDruid
  include Druid
  page_url "http://google.com"
end

class TestPageWithDirectUrl
  include Druid
  direct_url "http://google.com"
end

class AnotherPage
  include Druid
end

class YetAnotherPage
  include Druid
end

class TestWorld
  include Druid::PageFactory

  attr_accessor :driver
  attr_accessor :current_page
end


describe Druid::PageFactory do

  let(:world) { TestWorld.new }
  let(:driver) do
    world.driver = mock_driver
    driver = world.driver
  end

  it "should create a new page object and execute a block" do
    expect(driver).not_to receive(:goto)
    world.on_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end

  it "should create a new page object and execute a block using 'on'" do
    expect(driver).not_to receive(:goto)
    world.on FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end

  it "should create and visit a new page" do
    expect(driver).to receive(:goto)
    world.visit_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end

  it "should create and visit a new page using 'visit'" do
    expect(driver).to receive(:goto)
    world.visit FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
  end

  it "should create and visit a new page when url is defined as 'direct_url'" do
    expect(driver).to receive(:goto)
    world.visit TestPageWithDirectUrl do |page|
      expect(page).to be_instance_of TestPageWithDirectUrl
    end
  end

  it "should set an instance variable that can be used outside of the block" do
    expect(driver).not_to receive(:goto)
    page = world.on_page FactoryTestDruid
    current_page = world.instance_variable_get "@current_page"
    expect(current_page).to be page
  end

  it "should raise an error when you do not provide a default route" do
    expect { Druid::PageFactory.routes = {:another => []} }.to raise_error 'You must provide a :default route for PageFactory routes'
  end

  it "should store the routes" do
    routes = ['a', 'b', 'c']
    Druid::PageFactory.routes = {:default => routes}
    expect(Druid::PageFactory.page_object_routes[:default]).to eql routes
  end

  it "should navigate to a page calling the default methods" do
    pages = [[FactoryTestDruid, :a_method], [AnotherPage,:b_method]]
    Druid::PageFactory.routes = {:default => pages}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:a_method)
    expect(world.navigate_to(AnotherPage).class).to eql AnotherPage
  end

  it "should fail when it does not find a proper route" do
    Druid::PageFactory.routes = {:default => ['a'], :another => ['b']}
    expect{world.navigate_to(AnotherPage, :using => :no_route)}.to raise_error 'PageFactory route :no_route not found'
  end

  it "should fail when no default method specified" do
    Druid::PageFactory.routes = {:default => [[FactoryTestDruid, :a_method], [AnotherPage, :b_method]]}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).and_return(fake_page)
    expect(fake_page).to receive(:respond_to?).with(:a_method).and_return(false)
    expect{world.navigate_to(AnotherPage)}.to raise_error
  end

  it "should know how to continue routing from a location" do
    Druid::PageFactory.routes = {
      :default => [[FactoryTestDruid, :a_method], [AnotherPage, :b_method], [YetAnotherPage, :c_method]]
    }
    fake_page = double('a_page')
    expect(AnotherPage).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:respond_to?).with(:b_method).and_return(true)
    expect(fake_page).to receive(:b_method)
    expect(fake_page).to receive(:class).and_return(FactoryTestDruid)
    world.instance_variable_set :@current_page, fake_page
    expect(world.continue_navigation_to(YetAnotherPage).class).to eql YetAnotherPage
  end
end
