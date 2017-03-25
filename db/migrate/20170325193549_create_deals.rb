class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :discounted_price
      t.integer :quantity
      t.datetime :publish_date

      t.timestamps null: false
    end
  end
end
