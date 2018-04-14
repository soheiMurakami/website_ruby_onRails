class Sohei < ApplicationRecord
    belongs_to :viewer
    
    validates :name, presence: true
    validates :priority, presence: true
end
