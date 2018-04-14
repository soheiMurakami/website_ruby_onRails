class CreateSoheis < ActiveRecord::Migration[5.1]
  def change
    create_table :soheis do |t|
      t.string :name
      t.integer :priority
      t.integer :view_id

      t.timestamps
    end
  end
end
