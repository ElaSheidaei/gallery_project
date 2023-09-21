class User < ApplicationRecord
    has_many :galleries

    validates :first_name, :last_name, :password, presence: true
    validates :first_name, length: {minimum: 3}
end
