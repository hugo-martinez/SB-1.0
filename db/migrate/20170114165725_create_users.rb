class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.integer :phone_number
      t.integer :nb_skilly
      t.date :birth_date
      t.string :location
      t.string :photo
      t.integer :verif

      t.timestamps
    end
  end
end
