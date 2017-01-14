class CreateNotifs < ActiveRecord::Migration[5.0]
  def change
    create_table :notifs do |t|
      t.integer :user_id
      t.string :title
      t.string :msg
      t.string :status
      t.string :url

      t.timestamps
    end
  end
end
