class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :role
      t.integer :rating_id

      t.timestamps
    end
  end
end
