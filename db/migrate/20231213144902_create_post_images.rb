class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.references :user, foreign_key: true
      t.text :shop_name
      t.string :image_id
      t.text :caption
      t.timestamps
    end
  end


end
