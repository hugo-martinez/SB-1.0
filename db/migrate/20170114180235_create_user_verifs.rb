class CreateUserVerifs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_verifs do |t|
      t.integer :user_id
      t.string :code

      t.timestamps
    end
  end
end
