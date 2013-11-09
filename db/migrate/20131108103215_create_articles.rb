class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.boolean :published

      t.timestamps
    end
  end
end
