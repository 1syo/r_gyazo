require 'spec_helper'

shared_context "set up image url" do
  let(:host) { '127.0.0.1' }
  let(:port) { page.server.port }
  let(:text) do
    image_path(only_path: false, host: host, port: port, name: images.first.name, format: images.first.format)
  end
end

describe AdminController, js: true do
  subject { page }

  let!(:images) { FactoryGirl.create_list(:image, 10) }
  before { AdminController.any_instance.stub(:digest_authenticate) { true } }

  describe '#index' do
    before { visit admin_index_path }

    it { subject.status_code.should eq 200 }
    it { subject.should have_selector('a.show') }
  end

  describe '#show' do
    include_context "set up image url"

    before do
      visit admin_index_path
      click_link text
    end

    it { find('h3#show-image-url').text.should eq text }
  end

  describe '#delete' do
    include_context "set up image url"
    before { visit admin_index_path }

    context "should have confirm image src" do
      before { find('[data-image-src="' + text + '"]').click }
      it { find('#confirm-image-src')['src'].should eq text }
    end

    context "should have destroy succeed message" do
      before do
        find('[data-image-src="' + text + '"]').click
        find('a#delete-url.btn').click
      end

      it { should have_content(I18n.t('views.messages.destroy')) }
    end
  end
end
