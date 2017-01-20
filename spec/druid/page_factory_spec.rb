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

module ContainingModule
  class PageInsideModule
    include Druid
    page_url "http://google.co.uk"
  end
end

class WorldSuper
  attr_reader :super_called
  def on_page(cls, params={}, visit=false, &block)
    @super_called = true
  end
end

class TestWorld < WorldSuper
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

  it "should call super when non druid class passed" do
    class NoDruid
    end
    world.on(NoDruid)
    expect(world.super_called).to be true
  end

  it "should create a new page object and execute a block" do
    expect(driver).not_to receive(:goto)
    world.on_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.on_page "FactoryTestDruid" do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.on_page "ContainingModule::PageInsideModule" do |page|
      expect(page).to be_instance_of ContainingModule::PageInsideModule
    end
  end

  it "should create a new page object and execute a block using 'on'" do
    expect(driver).not_to receive(:goto)
    world.on FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.on "FactoryTestDruid" do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.on "ContainingModule::PageInsideModule" do |page|
      expect(page).to be_instance_of ContainingModule::PageInsideModule
    end
  end

  it "should create and visit a new page" do
    expect(driver).to receive(:goto).exactly(3).times
    world.visit_page FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.visit_page "FactoryTestDruid" do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.visit_page "ContainingModule::PageInsideModule" do |page|
      expect(page).to be_instance_of ContainingModule::PageInsideModule
    end
  end

  it "should merge params with the class level params if provided when visiting" do
    expect(driver).to receive(:goto)
    FactoryTestDruid.params = {:initial => :value}
    world.visit_page(FactoryTestDruid, :using_params => {:new_value => :merged})
    merged = FactoryTestDruid.instance_variable_get("@merged_params")
    expect(merged[:initial]).to eql :value
    expect(merged[:new_value]).to eql :merged
  end

  it "should use the params in the url when they are provided" do
    class PageUsingParams
      include Druid
      page_url "http://google.com/<%=params[:value]%>"
    end
    expect(driver).to receive(:goto).with("http://google.com/Druid")
    world.visit_page(PageUsingParams, :using_params => {:value => 'Druid'})
  end

  it "should use the params as well as interpolated values" do
    class PageUsingParamsAndInterpolated
      include Druid
      page_url "http://google.com/#{1+2}/<%=params[:value]%>"
    end
    expect(driver).to receive(:goto).with("http://google.com/3/Druid")
    world.visit_page(PageUsingParamsAndInterpolated, :using_params => {:value => 'Druid'})
  end

  it "should create and visit a new page using 'visit'" do
    expect(driver).to receive(:goto).exactly(3).times
    world.visit FactoryTestDruid do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.visit "FactoryTestDruid" do |page|
      expect(page).to be_instance_of FactoryTestDruid
    end
    world.visit "ContainingModule::PageInsideModule" do |page|
      expect(page).to be_instance_of ContainingModule::PageInsideModule
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

  it "should not execute block if page is not @current_page" do
    world.instance_variable_set "@current_page", TestPageWithDirectUrl.new(driver)
    world.if_page(FactoryTestDruid) do |page|
      fail
    end
    world.if_page("FactoryTestDruid") do |page|
      fail
    end
    world.if_page("ContainingModule::PageInsideModule") do |page|
      fail
    end
  end

  it "should return the @current_page if asking for another page" do
    expected = TestPageWithDirectUrl.new(driver)
    world.instance_variable_set "@current_page", expected
    expect(world.if_page(FactoryTestDruid)).to be expected
    expect(world.if_page("FactoryTestDruid")).to be expected
    expect(world.if_page("ContainingModule::PageInsideModule")).to be expected
  end

  it "should execute the block when we ask if it is the correct page" do
    world.instance_variable_set "@current_page", FactoryTestDruid.new(driver)
    done = false
    world.if_page(FactoryTestDruid) do |page|
      expect(page).to be_instance_of FactoryTestDruid
      done = true
    end
    expect(done).to be true
    done = false
    world.if_page("FactoryTestDruid") do |page|
      expect(page).to be_instance_of FactoryTestDruid
      done = true
    end
    expect(done).to be true
    done = false
    world.instance_variable_set "@current_page", ContainingModule::PageInsideModule.new(driver)
    world.if_page("ContainingModule::PageInsideModule") do |page|
      expect(page).to be_instance_of ContainingModule::PageInsideModule
      done = true
    end
    expect(done).to be true
  end

  it "should raise an error when you do not provide a default route" do
    expect { Druid::PageFactory.routes = {:another => []} }.to raise_error 'You must provide a :default route'
  end

  it "should store the routes" do
    routes = ['a', 'b', 'c']
    Druid::PageFactory.routes = {:default => routes}
    expect(Druid::PageFactory.routes[:default]).to eql routes
  end

  it "should navigate to a page calling the default methods" do
    pages = [[FactoryTestDruid, :a_method], [AnotherPage, :b_method]]
    Druid::PageFactory.routes = {:default => pages}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:a_method)
    expect(world.navigate_to(AnotherPage).class).to eql AnotherPage
  end

  it "should pass parameters to methods when navigating" do
    pages = [[FactoryTestDruid, :a_method, 'blah'], [AnotherPage, :b_method]]
    Druid::PageFactory.routes = {:default => pages}
    fake_page = double('a_page')
    expect(FactoryTestDruid).to receive(:new).with(driver,false).and_return(fake_page)
    expect(fake_page).to receive(:a_method).with('blah')
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
    Druid::PageFactory.routes = {:default => [[FactoryTestDruid, :a_method], [AnotherPage, :b_method], [YetAnotherPage, :c_method]]}
    world.current_page = FactoryTestDruid.new(driver)
    f_page = FactoryTestDruid.new(driver)
    allow(FactoryTestDruid).to receive(:new).with(driver,false).and_return(f_page)
    allow(f_page).to receive(:respond_to?).with(:a_method).and_return(true)
    allow(f_page).to receive(:a_method)
    a_page = AnotherPage.new(driver)
    allow(AnotherPage).to receive(:new).with(driver,false).and_return(a_page)
    allow(a_page).to receive(:respond_to?).with(:b_method).and_return(true)
    allow(a_page).to receive(:b_method)
    expect(world.continue_navigation_to(YetAnotherPage).class).to eql YetAnotherPage
  end
end
