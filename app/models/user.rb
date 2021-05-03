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
        start_date = created_at.to_datetime
        current_date = DateTime.now

        days = (start_date...current_date).count
        months = (current_date.year * 12 + current_date.month) - (start_date.year * 12 + start_date.month)

        user_years_fmt(days, months % 12, months / 12) 
    end

    def user_years_fmt(days, months, years)

        timeframe = []
        timeframe << date_part_pluralize(years,'year')
        timeframe << date_part_pluralize(months,'month')
        timeframe << date_part_pluralize(days,'day')
        timeframe.collect {|part| part if part != ""}.compact.join(", ")

    end

    def date_part_pluralize(amount, date_part)

        if amount == 0
            date_part_text = ""
        else
            date_part_text = "#{amount} #{date_part}"
            "#{date_part_text}s" if amount >= 1
        end
        
    end

end
