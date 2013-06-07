class CreateCarpets < ActiveRecord::Migration
  def change
    create_table :carpets do |t|
      t.string :name
      t.integer :carpet_range_id
      t.float :price
      t.text :available_colours

      t.timestamps
    end
  end
end
