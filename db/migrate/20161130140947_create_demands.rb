class CreateDemands < ActiveRecord::Migration[5.0]
  def change
    create_table :demands do |t|
      t.integer :user_id
      t.integer :theme_id
      t.string :comment

      t.timestamps
    end
  end
end
