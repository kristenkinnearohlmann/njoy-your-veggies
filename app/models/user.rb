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
        byebug
        user_years_fmt(days, months % 12, months / 12) 
    end

    def user_years_fmt(days, months, years)
        byebug

        year_text = ""
        month_text = ""
        day_text = ""

        if years != 0
            year_text = "#{years} #{"year".pluralize} and "
        end

        "#{year_text}#{"month".pluralize}"
    end

end
