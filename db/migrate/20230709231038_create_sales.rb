class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :quantity
      t.integer :sub_total
      t.references :album, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
