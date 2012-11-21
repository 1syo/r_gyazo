FactoryGirl.define do
  factory :image do
    data { open(File.join(Rails.root, 'spec', 'factories', 'dummy-image.png'), "rb").read }
  end
end
