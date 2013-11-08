class AddStuffToGram < ActiveRecord::Migration
  def change
    add_column :grams, :low_res, :string
    add_column :grams, :standard_res, :string
  end
end
