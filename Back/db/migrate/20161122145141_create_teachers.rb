class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :user_id
      t.string :integer
      t.string :theme_id
      t.string :integer
      t.string :title
      t.string :string
      t.string :description
      t.string :string
      t.string :cost
      t.string :integer
      t.string :photo
      t.string :string

      t.timestamps
    end
  end
end
