require "spec_helper"

describe ImagesController, :type => :routing do
  let!(:name) { Digest::SHA1.hexdigest(FactoryGirl.attributes_for(:image)[:data]) }
  let(:format) { "png" }

  it '/:id.:format is routable' do
    {:get => image_path(name: name, format: format)}.should be_routable
  end

  it '/create is routable' do
    {:post => images_path}.should be_routable
  end
end
