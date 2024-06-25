# app/helpers/posts_helper.rb
module PostsHelper
    def post_formatted_date(date)
      date.strftime("%B %d, %Y")
    end
end
  