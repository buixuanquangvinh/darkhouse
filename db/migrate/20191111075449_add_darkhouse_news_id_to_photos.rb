class AddDarkhouseNewsIdToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :darkhouse_news_id, :integer
  end
end
