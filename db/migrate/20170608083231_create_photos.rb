class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :location
      t.integer :album_id
      t.integer :user_id
      t.string :image
      t.text :caption

      t.timestamps

    end
  end
end
