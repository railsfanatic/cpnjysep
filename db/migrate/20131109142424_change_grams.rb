class ChangeGrams < ActiveRecord::Migration
  def change
    change_column :grams, :caption, :text
  end
end
