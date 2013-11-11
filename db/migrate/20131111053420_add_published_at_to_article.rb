class AddPublishedAtToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :datetime
    remove_column :articles, :published, :boolean
    add_index :articles, :published_at
  end
end
