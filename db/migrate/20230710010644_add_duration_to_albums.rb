class AddDurationToAlbums < ActiveRecord::Migration[7.0]
  def up
    add_column :albums, :duration, :integer
  end
  def down
    remove_column :albums, :duration
  end
end
