class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :pName
      t.string :brand
      t.float :averageCost
      t.string :category
      t.date :releaseDate
      t.text :description
      t.string :productImage

      t.timestamps
    end
  end
end
