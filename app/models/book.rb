class Book < ApplicationRecord
    has_many :authors, dependent: :destroy
    acts_as_paranoid

    #Metaprogramming
    %w(title content).each do |attribute|
        validates attribute, presence: true
    end

    #Cache
    def self.cached_all
        Rails.cache.fetch('all_books', expires_in: 12.hours) do
          Book.all.to_a
        end
    end
end
