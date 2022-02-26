class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :likes
      t.integer :retweets

      t.timestamps
    end
  end
end
