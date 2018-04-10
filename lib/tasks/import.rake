require 'csv'

namespace :import do
    
    desc "import csv"
    task ratings: :environment do
        filename = File.join.Rails.root, "sample.csv"
        CSV.foreach(filename) do |row|
            p row
        end
    end
end