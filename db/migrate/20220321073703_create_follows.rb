class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :following_id, null: false, index: true

      t.index [:user_id, :following_id], unique: true

      t.timestamps
    end
  end
end
