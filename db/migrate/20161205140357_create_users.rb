class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.integer :nb_skilly
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.integer :age
      t.string :photo

      t.timestamps
    end
  end
end
