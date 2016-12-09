require 'spec_helper'
require 'druid/page_factory'

class FactoryTestDruid
  include Druid
  page_url "http://google.com"
  navigation_method :a_method
end

class AnotherPage
  include Druid
  navigation_method :b_method
end

class YetAnotherPage
  include Druid
  navigation_method :c_method
end

class TestWorld
  include Druid::PageFactory

  attr_accessor :driver
end


describe Druid::PageFactory do
  # before(:each) do
  #   @world = TestWorld.new
  #   @world.driver = mock_driver
  # end
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

  it "should create and visit a new page" do
    expect(driver).to receive(:goto)
    world.visit_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
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
    pages = [FactoryTestDruid, AnotherPage]
    Druid::PageFactory.routes = {:default => pages}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:a_method)
    expect(world.navigate_to(AnotherPage).class).to eql AnotherPage
  end

  it "should fail when it does not find a proper route" do
    Druid::PageFactory.routes = {:default => ['a'], :another => ['b']}
    expect{world.navigate_to(AnotherPage, :using => :no_route)}.to raise_error(RuntimeError)
  end

  it "should fail when no default method specified" do
    Druid::PageFactory.routes = {:default => [FactoryTestDruid, AnotherPage]}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).and_return(fake_page)
    expect(fake_page).to receive(:respond_to?).with(:a_method).and_return(false)
    expect{world.navigate_to(AnotherPage)}.to raise_error
  end

  it "should know how to continue routing from a location" do
    Druid::PageFactory.routes = {:default => [FactoryTestDruid, AnotherPage, YetAnotherPage]}
    fake_page = double('a_page')
    expect(FactoryTestDruid).not_to receive(:new)
    expect(AnotherPage).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:respond_to?).with(:b_method).and_return(true)
    expect(fake_page).to receive(:b_method)
    world.instance_variable_set :@current_page, FactoryTestDruid
    expect(world.continue_navigation_to(YetAnotherPage).class).to eql YetAnotherPage
  end
end
