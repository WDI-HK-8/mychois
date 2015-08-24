class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.string :name
      t.decimal :price
      t.decimal :sale_price

      t.timestamps null: false
    end
  end
end