class AddIndexesToTweetAndGram < ActiveRecord::Migration
  def change
    add_index :tweets, :tweet_id
    add_index :tweets, :created_at
    add_index :grams, :media_id
    add_index :grams, :created_at
  end
end
