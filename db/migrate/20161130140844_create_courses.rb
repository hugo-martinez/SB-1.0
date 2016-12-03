class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.integer :theme_id
      t.string :title
      t.string :description
      t.integer :cost
      t.string :photo

      t.timestamps
    end
  end
end
