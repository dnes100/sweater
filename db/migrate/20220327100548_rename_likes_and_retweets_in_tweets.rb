class RenameLikesAndRetweetsInTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :likes, :likes_count
    rename_column :tweets, :retweets, :retweets_count
  end
end
