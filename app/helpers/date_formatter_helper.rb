# app/helpers/date_formatter_helper.rb
module DateFormatterHelper
    def format_date(date, format = :long)
      date.strftime(format == :short ? "%m/%d/%Y" : "%B %d, %Y")
    end
end
  