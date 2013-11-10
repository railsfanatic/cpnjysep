namespace :social do
  desc "Update Tweets"
  task pull_tweets: :environment do
    puts "Updating Tweets ..."
    Tweet.pull_tweets
  end
  
  desc "Update Instagram"
  task pull_grams: :environment do
    puts "Updating Instagram media ..."
    Gram.pull_grams
  end
  
  desc "Update All Social Media"
  task update_all: [:pull_tweets, :pull_grams]
end
