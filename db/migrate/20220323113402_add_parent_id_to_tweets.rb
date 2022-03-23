class AddParentIdToTweets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :parent
  end
end
