class AddSortToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :sort, :integer
    add_column :photos, :image_type, :integer
  end
end
