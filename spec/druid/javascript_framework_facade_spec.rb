require 'spec_helper'
require 'druid/javascript/jquery'

class TestClass
  include Druid::JavascriptFrameworkFacade
end

describe Druid::JavascriptFrameworkFacade do
  let(:facade) { Druid::JavascriptFrameworkFacade }

  it "should allow the selection of a javascript framework" do
    facade.framework = :jquery
    expect(facade.framework).to eql :jquery
  end

  it "should register the jQuery script builder" do
    facade.framework = :jquery
    expect(facade.script_builder).to eql Druid::Javascript::JQuery
  end

  it "should return script for pending requests in jQuery" do
    facade.framework = :jquery
    expect(facade.pending_requests).to eql 'return jQuery.active'
  end
end
