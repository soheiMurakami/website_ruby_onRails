class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.string :name
      t.integer :priority
      t.integer :viewer_id

      t.timestamps
    end
  end
end
