class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :thump
      t.string :image
      t.string :sort_content
      t.string :content
      t.boolean :active
      t.belongs_to :category, index: true
      t.belongs_to :create_by
      t.belongs_to :updated_by
      t.timestamps
    end
  end
end
