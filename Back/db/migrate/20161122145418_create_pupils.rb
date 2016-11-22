class CreatePupils < ActiveRecord::Migration[5.0]
  def change
    create_table :pupils do |t|
      t.string :user_id
      t.string :integer
      t.string :theme_id
      t.string :integer

      t.timestamps
    end
  end
end
