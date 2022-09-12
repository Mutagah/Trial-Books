class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :purchase_title
      t.string :customer_id
      t.string :book_id
    end
  end
end
