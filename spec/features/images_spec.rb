require 'spec_helper'

describe ImagesController do
  let!(:config) { YAML.load_file(File.join(Rails.root,'config','config.yml'))["test"] }
  let!(:rgyazo_id) { config["rgyazo_id"] }
  let!(:file) { open(File.join(Rails.root, 'spec', 'factories', 'dummy-image.png'), "rb") }
  let!(:imagedata) { Rack::Test::UploadedFile.new(file.path) }

  before do
    page.driver.browser.post images_url, {id: rgyazo_id, imagedata: imagedata}
  end

  it { page.status_code.should eq 200 }
  it { page.body.should match /#{Capybara.current_host}\/[0-9a-zA-Z]{6}.png/ }
end
