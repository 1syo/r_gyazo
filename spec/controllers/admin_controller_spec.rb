require 'spec_helper'

describe AdminController do
  before do
    AdminController.any_instance.stub(:digest_authenticate) { true }
  end

  describe "GET 'index'" do
    before { get 'index' }
    it { response.should be_success }
  end

  describe "DELETE 'destroy'" do
    let!(:image) { FactoryGirl.create(:image) }
    before { delete 'destroy', id: image.id }
    it { should redirect_to(admin_index_url) }
  end
end
