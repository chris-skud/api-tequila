class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :style
      t.integer :brand_id
      t.foreign_key :brands
      t.timestamps
    end
  end
end
