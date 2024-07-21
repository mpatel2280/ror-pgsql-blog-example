class Book < ApplicationRecord
    has_many :authors, dependent: :destroy
    acts_as_paranoid
end
