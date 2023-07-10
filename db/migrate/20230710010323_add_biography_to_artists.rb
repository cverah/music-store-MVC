class AddBiographyToArtists < ActiveRecord::Migration[7.0]
  def up
    # para mas de una columna
    # change_table :products do |t|
    #   t.change :price, :string
    # end
    add_column :artists, :biography, :string
  end
  def down
      remove_column :artists, :biography, :string
  end
end
