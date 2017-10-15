require 'spec_helper'

class DruidPagePopulator
  include Druid

  text_field(:tf, :id => 'id')
  text_area(:ta, :id => 'id')
  select_list(:sl, :id => 'id')
  checkbox(:cb, :id => 'id')
  radio_button(:rb, :id => 'id')
  file_field(:ff, :id => 'id')
  radio_button_group(:rbg, :id => 'id')
end

describe Druid::PagePopulator do
  let(:driver) { mock_driver }
  let(:druid) { DruidPagePopulator.new(driver) }

  it "should set a value in a text field" do
    expect(druid).to receive(:tf=).with('value')
    expect(druid).to receive(:is_enabled?).and_return(true)
    druid.populate_page_with('tf' => 'value')
  end

  it "should not set a value if it is not found on the page" do
    expect(druid).not_to receive(:text_field)
    druid.populate_page_with('coffee' => 'value')
  end

  it "should not populate a text field when it is not visible" do
    expect(druid).not_to receive(:tf=)
    expect(druid).to receive(:tf_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(true)
    expect(driver).to receive(:visible?).and_return(false)
    expect(driver).to receive(:tag_name).and_return('input')
    druid.populate_page_with('tf' => true)
  end

  it "should set a value in a text area" do
    expect(druid).to receive(:ta=).with('value')
    expect(druid).to receive(:ta_element).and_return(driver)
    expect(driver).to receive(:tag_name).and_return('textarea')
    druid.populate_page_with('ta' => 'value')
  end

  it "should set a value in a select list" do
    expect(druid).to receive(:sl=).with('value')
    druid.populate_page_with('sl' => 'value')
  end

  it "should set a value in a file field" do
    expect(druid).to receive(:ff=).with('value')
    expect(druid).to receive(:is_enabled?).and_return(true)
    druid.populate_page_with('ff' => 'value')
  end

  it "should check a checkbox to true is specified" do
    expect(druid).to receive(:check_cb)
    expect(druid).to receive(:is_enabled?).and_return(true)
    druid.populate_page_with('cb' => true)
  end

  it "should uncheck a checkbox to false is specified" do
    expect(druid).to receive(:uncheck_cb)
    expect(druid).to receive(:is_enabled?).and_return(true)
    druid.populate_page_with('cb' => false)
  end

  it "should select a radio button when true is specified" do
    expect(druid).to receive(:select_rb)
    expect(druid).to receive(:is_enabled?).and_return(true)
    druid.populate_page_with('rb' => true)
  end

  it "should select the correct element from a radio button group" do
    expect(druid).to receive(:select_rbg).with('blah')
    druid.populate_page_with('rbg' => 'blah')
  end

  it "should not populate a checkbox if it is disabled" do
    expect(druid).not_to receive(:check_cb)
    expect(druid).to receive(:cb_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(false)
    expect(driver).to receive(:tag_name).and_return('input')
    druid.populate_page_with('cb' => true)
  end

  it "should not populate a checkbox if it is not visible" do
    expect(druid).not_to receive(:check_cb)
    expect(druid).to receive(:cb_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(true)
    expect(driver).to receive(:visible?).and_return(false)
    expect(driver).to receive(:tag_name).and_return('input')
    druid.populate_page_with('cb' => true)
  end

  it "should not populate a radio button when it is disabled" do
    expect(druid).not_to receive(:select_rb)
    expect(druid).to receive(:rb_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(false)
    expect(driver).to receive(:tag_name).and_return('input')
    druid.populate_page_with('rb' => true)
  end

  it "should not populate a text field when it is disabled" do
    expect(druid).not_to receive(:tf=)
    expect(druid).to receive(:tf_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(false)
    expect(driver).to receive(:tag_name).and_return("input")
    druid.populate_page_with('tf' => 'test')
  end

  it "should not populate a radio button when it is not visible" do
    expect(druid).not_to receive(:select_rb)
    expect(druid).to receive(:rb_element).twice.and_return(driver)
    expect(driver).to receive(:enabled?).and_return(true)
    expect(driver).to receive(:visible?).and_return(false)
    expect(driver).to receive(:tag_name).and_return('input')
    druid.populate_page_with('rb' => true)
  end

end
