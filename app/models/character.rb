class Character < ApplicationRecord
    belongs_to :rating
    
    validates :name, presence: true 
    validates :role, presence: true  
    validates :rating_id, presence: true  
end
