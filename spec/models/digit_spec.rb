require 'spec_helper'

describe Digit do

  context "without argumanet" do
    it { Digit.generate.should match /[0-9a-zA-Z]/ }
  end

  context "with argumanet" do
    let!(:length) { 6 }
    it { Digit.generate(length).should match /[0-9a-zA-Z]{#{length}}/ }
  end
end
