# app/helpers/posts_helper.rb
module PostsHelper
    def formatted_date(date)
      date.strftime("%B %d, %Y")
    end
end
  