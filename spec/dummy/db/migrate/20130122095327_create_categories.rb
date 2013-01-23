class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :blog
      t.string :name

      t.timestamps
    end
    add_index :categories, :blog_id
  end
end
