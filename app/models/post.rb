class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 10, maximum: 50 }
    has_many :comments, dependent: :destroy
    before_save :capitalize_title

    private

    def capitalize_title
        self.title = title.capitalize
    end

end
