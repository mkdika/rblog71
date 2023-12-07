class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 100

      t.timestamps
    end
    enable_extension :citext
    change_column :categories, :name, :citext
    add_index :categories, :name, unique: true
  end
end
