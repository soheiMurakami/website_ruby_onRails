class CreateCsvuploads < ActiveRecord::Migration[5.1]
  def change
    create_table :csvuploads do |t|
      t.string :name
      t.integer :rating
      t.string :description

      t.timestamps
    end
  end
end
