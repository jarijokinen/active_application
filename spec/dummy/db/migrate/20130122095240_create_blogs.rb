class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :blogs, :user_id
  end
end
