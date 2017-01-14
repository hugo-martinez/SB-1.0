class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :conv_id
      t.integer :user_id
      t.string :msg

      t.timestamps
    end
  end
end
