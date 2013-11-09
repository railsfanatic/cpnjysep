class Tweet < ActiveRecord::Base
  def self.pull_tweets
    Twitter.favorites("Bahai_Quote").each do |tweet|
      unless exists?(tweet_id: tweet.id.to_s)
        create!(
          tweet_id: tweet.id,
          content: tweet.text,
          screen_name: tweet.user.screen_name,
          created_at: tweet.created_at
        )
      end
    end
  end
end
