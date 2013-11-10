namespace :social do
  desc "Update Tweets"
  task pull_tweets: :environment do
    puts "Updating Tweets ..."
    Tweet.pull_tweets
  end
  
  desc "Clear Tweets Cache"
  task clear_tweets: :environment do
    puts "Clearning Tweets cache ..."
    Tweet.delete_all
  end
  
  desc "Clear Instagram Cache"
  task clear_grams: :environment do
    puts "Clearing Instagram cache ..."
    Gram.delete_all
  end
  
  desc "Update Instagram"
  task pull_grams: :environment do
    puts "Updating Instagram media ..."
    Gram.pull_grams
  end
  
  desc "Update All Social Media"
  task update_all: [:pull_tweets, :pull_grams]
end
