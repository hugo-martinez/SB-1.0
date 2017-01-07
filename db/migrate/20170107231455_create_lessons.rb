class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :course_origin
      t.integer :teacher_id
      t.integer :pupil_id
      t.integer :origin_id
      t.date :date
      t.string :location
      t.integer :cost
      t.integer :evolution

      t.timestamps
    end
  end
end
