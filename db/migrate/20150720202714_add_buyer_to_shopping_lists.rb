class AddBuyerToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :buyer_id, :integer
    add_index :shopping_lists, :buyer_id
  end
end
