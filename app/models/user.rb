class User < ApplicationRecord
    has_secure_password
    has_many :recipes

    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true

    def joined_date
        created_at.strftime("%-d %B %Y")
    end

    def user_years
        ((DateTime.now - created_at) / 365).floor
    end
end
