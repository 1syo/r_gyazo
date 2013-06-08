class Image < ActiveRecord::Base
  attr_accessible :name, :data

  validates :name, presence: true, uniqueness: true
  validates :data, presence: true

  before_validation(on: :create) do
    self.name = generate_name
  end

  def content_type
    'image/png'
  end

  def format
    'png'
  end

  def image_path
    image_path(only_path: false, name: self.name, format: self.format)
  end

  private
  def generate_name
    begin
      name = Digit.generate(6)
    end while Image.exists?(name: name)

    name
  end

  rails_admin do 
    list do
      field :name do
        formatted_value do
#          bindings[:view].link_to(bindings[:controller].main_app.image_path(only_path: false, name: bindings[:object].name, format: bindings[:object].format))
        end
      end
      field :created_at
    end
  end
end
