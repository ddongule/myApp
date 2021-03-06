class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :image

      t.integer :user_id
      t.references :team, foreign_key: true

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
