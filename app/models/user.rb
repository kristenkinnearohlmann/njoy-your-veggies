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
        byebug
        # ((DateTime.now - created_at.to_datetime) / 365).floor
        # distance_of_time_in_words(created_at.to_datetime,DateTime.now)
        ((DateTime.now - created_at.to_datetime) / 24.hour).round
    end
end
