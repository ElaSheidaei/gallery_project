class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :galleries

    # validates :first_name, :last_name, :password, presence: true
    # validates :first_name, length: {minimum: 3}
end
