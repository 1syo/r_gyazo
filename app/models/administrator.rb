class Administrator < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  rails_admin do
    list do
      field :email
      field :sign_in_count
      field :current_sign_in_at
    end

    edit do
      field :email
      field :password
      field :password_confirmation
    end
  end
end
