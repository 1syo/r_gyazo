require 'spec_helper'

describe Image do
  let!(:attr) { FactoryGirl.attributes_for(:image) }

  context "valid attributes" do
    subject { Image.new(attr) }
    it { should be_valid }
  end

  context "invalid attributes" do
    subject { Image.new }
    it { should be_invalid }
  end

  context "setting name feild" do
    subject { Image.new(attr) }
    before { subject.valid? }
    it { subject.name.should be_present }
  end
end
