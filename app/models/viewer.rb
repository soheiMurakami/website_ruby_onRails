class Viewer < ApplicationRecord
    has_secure_password
    
    has_many :ratings, dependent: :destroy
    
    validates :name, presence: true
    validates :email, format: { with: /@/, message: "need a @" }, uniqueness: true
    
    attr_accessor :current_password
    
    def update_with_password(params)
        if self.authenticate(params[:current_password])
            self.update_attributes(params)
        else
            self.errors.add(:current_password, "is not correct.")
            false
        end
    end
    
end
