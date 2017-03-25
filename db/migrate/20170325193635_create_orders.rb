class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :deal_id
      t.integer :user_id
      t.integer :final_price

      t.timestamps null: false
    end
  end
end
