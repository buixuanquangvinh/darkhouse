class CreateCustomerComments < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_comments do |t|
      t.string :name
      t.string :quote
      t.string :image
      t.timestamps
    end
  end
end
