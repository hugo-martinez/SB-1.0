class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.integer :dem_id
      t.date :date
      t.integer :cost
      t.integer :status

      t.timestamps
    end
  end
end
