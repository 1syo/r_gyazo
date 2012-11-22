require 'spec_helper'

describe ImagesController do
  describe "GET 'show'" do
    let!(:image) { FactoryGirl.create(:image) }
    before { get 'show',{name: image.name, format: image.format} }
    it { response.should be_success }
  end

  describe "POST 'create'" do
    let!(:config) { YAML.load_file(File.join(Rails.root,'config','config.yml'))["test"] }
    let!(:rgyazo_id) { config["rgyazo_id"] }

    context 'valid rgyzo_id' do
      context 'valid post params' do
        let!(:file) { open(File.join(Rails.root, 'spec', 'factories', 'dummy-image.png'), "rb") }
        let!(:imagedata) { Rack::Test::UploadedFile.new(file.path) }
        let(:image) { assigns(:image) }

        before do
          post 'create', { id: rgyazo_id, imagedata: imagedata , format: :cgi}
        end

        it { response.body.should have_content(image_url(only_path: false, name: image.name, format: image.format)) }
      end

      context 'invalid post params' do
        before do
          ImageUploader.any_instance.stub(:origin) {}
          post 'create', {id: rgyazo_id, format: :cgi}
        end

        it { should redirect_to(error_404_url(format: :text)) }
      end
    end

    context 'invalid rgyazo_id' do
      context 'invalid rgyazo_id' do
        before { post 'create', {id: Forgery::Basic.text} }
        it { should redirect_to(error_403_url) }
      end

      context 'not send rgyazo_id' do
        before { post 'create' }
        it { should redirect_to(error_403_url) }
      end
    end
  end
end
