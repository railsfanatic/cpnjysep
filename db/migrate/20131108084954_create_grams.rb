class CreateGrams < ActiveRecord::Migration
  def change
    create_table :grams do |t|
      t.string :media_id
      t.string :media_type
      t.string :link
      t.string :caption

      t.timestamps
    end
  end
end
