class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.text :title
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
