class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.datetime :starts_at
      t.integer :length_in_minutes
      t.text :description

      t.timestamps
    end
  end
end
