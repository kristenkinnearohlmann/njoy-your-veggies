class User < ApplicationRecord
    has_secure_password
    has_many :recipes

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true

end
