class Character < ApplicationRecord
    belongs_to :rating
    
    validates :name, presence: true 
    validates :role, presence: true  
    validates :rating_id, presence: true
    
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
        Character.create! row.to_hash
        end
    end
    
   
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |character|
                csv << character.attributes.values_at(*column_names)
            end
        end
        
    end
    

end

   