class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :user_id1
      t.integer :user_id2

      t.timestamps
    end
  end
end
