class Book < ApplicationRecord
    has_many :authors, dependent: :destroy
    acts_as_paranoid

    #Metaprogramming
    %w(title content).each do |attribute|
        validates attribute, presence: true
    end
end
