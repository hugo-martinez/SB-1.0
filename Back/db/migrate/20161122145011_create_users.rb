class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :nb_skilly
      t.string :integer
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string
      t.string :email
      t.string :string
      t.string :location
      t.string :string
      t.string :age
      t.string :integer
      t.string :photo
      t.string :string

      t.timestamps
    end
  end
end
