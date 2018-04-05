class AddVidAndTokenToViewers < ActiveRecord::Migration[5.1]
  def change
    add_column :viewers, :vid, :string
    add_column :viewers, :token, :string
  end
end
