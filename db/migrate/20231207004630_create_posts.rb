class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :permalink
      t.string :title, limit: 100
      t.text :content
      t.boolean :release, default: false
      t.datetime :release_date
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :posts, :permalink, unique: true
    add_index :posts, :release_date, order: {release_date: :desc}
  end
end
