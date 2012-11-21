require 'spec_helper'

describe ImageUploader do
  let!(:file) { open(File.join(Rails.root, 'spec', 'factories', 'dummy-image.png'), "rb") }
  subject { ImageUploader.new(file) }
  it { subject.path.should eq file.path }
  it { subject.origin.should eq file.read }
end
