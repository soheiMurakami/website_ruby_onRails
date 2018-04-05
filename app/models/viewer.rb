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
    
    def self.create_from_hash(viewer_hash)
        viewer = Viewer.new
        viewer.name = viewer_hash[:name]
        viewer.email = viewer_hash[:email]
        viewer.vid = viewer_hash[:vid]
        viewer.token = viewer_hash[:token]
        viewer.password_digest = "0"
        viewer
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest != "0"
    end
end
