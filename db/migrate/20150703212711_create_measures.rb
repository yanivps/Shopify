class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :unit, default: 0, null: false
      t.float :quantity
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :shopping_lists
  end
end
