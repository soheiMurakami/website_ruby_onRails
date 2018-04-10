class AddViewerIdToViewers < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :viewer_id, :integer
  end
end
