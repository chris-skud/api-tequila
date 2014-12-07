class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.integer :producer_id
      t.foreign_key :producers
      t.timestamps
    end
  end
end
