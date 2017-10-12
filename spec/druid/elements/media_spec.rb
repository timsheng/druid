require 'spec_helper'

describe Druid::Elements::Media do
  let(:element) { double 'element' }
  let(:media) { Druid::Elements::Media.new(element) }

  it "should return controls" do
    expect(media).to receive(:attribute).with(:controls).and_return(true)
    expect(media.has_controls?).to eq(true)
  end

end
