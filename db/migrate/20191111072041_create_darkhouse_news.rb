class CreateDarkhouseNews < ActiveRecord::Migration[6.0]
  def change
    create_table :darkhouse_news do |t|
      t.string :title
      t.string :slug
      t.string :image
      t.string :sort_content
      t.string :content
      t.boolean :active
      t.boolean :highlight
      t.belongs_to :create_by
      t.belongs_to :updated_by
      t.timestamps
    end
  end
end
