class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.references :user, index: true
      t.string :title
      t.boolean :was_bought, default: false

      t.timestamps null: false
    end
    add_foreign_key :shopping_lists, :users
  end
end
