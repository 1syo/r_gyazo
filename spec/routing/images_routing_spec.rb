require "spec_helper"

describe ImagesController, :type => :routing do
  let!(:image) { FactoryGirl.create(:image) }

  it '/:name.:format is routable' do
    {get: image_path(name: image.name, format: image.format)}.should be_routable
  end

  it '/upload.cgi is routable' do
    {post: images_path}.should be_routable
  end
end
