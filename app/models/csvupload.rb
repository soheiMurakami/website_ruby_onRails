class Csvupload < ApplicationRecord
    def self. import(file)
     CSV.foreach(file.path, headers: true) do |row|
            Csvupload.create! row.to_hash
        end
    end
end
