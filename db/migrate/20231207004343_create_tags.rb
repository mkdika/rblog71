class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, limit: 100

      t.timestamps
    end
    enable_extension :citext
    change_column :tags, :name, :citext
    add_index :tags, :name, unique: true
  end
end
