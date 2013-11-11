class AddThumbnailToGram < ActiveRecord::Migration
  def change
    add_column :grams, :thumbnail, :string
  end
end
