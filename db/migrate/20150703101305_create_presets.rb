class CreatePresets < ActiveRecord::Migration
  def change
    create_table :presets do |t|
      t.references :user, index: true
      t.string :title, null: false

      t.timestamps null: false
    end
    add_foreign_key :presets, :users
  end
end
