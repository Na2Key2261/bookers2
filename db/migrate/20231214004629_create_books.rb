class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title  # この行を追加
      t.text :body
      t.timestamps
    end
  end
end
