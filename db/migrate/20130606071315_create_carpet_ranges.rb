class CreateCarpetRanges < ActiveRecord::Migration
  def change
    create_table :carpet_ranges do |t|
      t.string :name
      t.timestamps
    end
  end
end
