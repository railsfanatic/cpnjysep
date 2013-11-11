namespace :social do
  desc "Refresh Social Media Caches"
  task refresh: :environment do
    puts "Updating Twitter cache ..."
    Tweet.refresh
    puts "Updating Instagram cache ..."
    Gram.refresh
  end
end
