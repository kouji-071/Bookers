class RemoveIndexEmailFromUsrs < ActiveRecord::Migration[5.2]
  def change
  	remove_index :users, column: :email, unique: true
  end

  def up
  	remove_index :user, :email
  end

  def down
  	add_index :users, :email, unique: true
  end
end
