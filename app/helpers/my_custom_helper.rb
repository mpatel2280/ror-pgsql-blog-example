# app/helpers/my_custom_helper.rb
module MyCustomHelper
    def display_notice(notice)
      content_tag(:div, notice, class: 'notice') if notice
    end
end
  