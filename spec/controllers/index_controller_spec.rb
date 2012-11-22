require 'spec_helper'

describe IndexController do
  describe "GET 'error_404'" do
    subject { get 'error_404' }
    it { should be_success }
  end

  describe "GET 'error_403'" do
    subject { get 'error_403' }
    it { should be_success }
  end
end
