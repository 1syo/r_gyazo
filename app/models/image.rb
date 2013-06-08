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

  private
  def generate_name
    begin
      name = Digit.generate(6)
    end while Image.exists?(name: name)

    name
  end

  rails_admin do 
     list do
       field :name
       field :created_at
     end
  end
end
