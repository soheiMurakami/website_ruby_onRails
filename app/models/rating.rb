class Rating < ApplicationRecord
    has_many :characters, dependent: :destroy
    validates :title, presence: true
    validates :rating, presence: true
    validates :description, presence: true
end
