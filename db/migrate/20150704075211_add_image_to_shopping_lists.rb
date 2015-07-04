class AddImageToShoppingLists < ActiveRecord::Migration
  def change
    add_column :shopping_lists, :image, :string
  end
end
