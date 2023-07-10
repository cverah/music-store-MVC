class AddIndexesToCustomersUsernameAndEmail < ActiveRecord::Migration[7.0]
  def up
    # add_index :customers, :username, unique: true
    # add_index :customers, :email, unique: true
    # para uno solo
    add_index :customers, [:username, :email], unique: true
  end
  def down
    remove_index :customers, [:username, :email]
  end
end
