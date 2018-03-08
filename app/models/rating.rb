class Rating < ApplicationRecord
    validates :title, presence: true
    validates :rating, presence: true
    validates :description, presence: true
    
end
