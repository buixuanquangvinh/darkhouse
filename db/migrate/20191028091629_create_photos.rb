class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :thump
      t.string :image
      t.belongs_to :news, index: true
      t.timestamps
    end
  end
end
