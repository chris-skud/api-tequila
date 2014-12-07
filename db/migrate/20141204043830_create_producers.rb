class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
      t.integer :nom
      t.integer :dot
      t.string :address
      t.string :telephone
      t.timestamps
    end
  end
end
