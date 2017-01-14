class CreateFeedBacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feed_backs do |t|
      t.integer :lessons_id
      t.integer :feed_backer_id
      t.integer :note
      t.string :comment

      t.timestamps
    end
  end
end
