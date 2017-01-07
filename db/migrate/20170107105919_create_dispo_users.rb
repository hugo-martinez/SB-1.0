class CreateDispoUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :dispo_users do |t|
      t.integer :user_id
      t.date :dispo

      t.timestamps
    end
  end
end
