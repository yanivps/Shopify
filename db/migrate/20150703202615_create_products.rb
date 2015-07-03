class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, index: true
      t.references :shopping_list, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :users
    add_foreign_key :products, :shopping_lists
  end
end
