class AddViewerIdToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :viewer_id, :integer
  end
end
