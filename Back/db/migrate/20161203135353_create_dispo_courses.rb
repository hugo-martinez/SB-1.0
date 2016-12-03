class CreateDispoCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :dispo_courses do |t|
      t.integer :course_id
      t.date :date

      t.timestamps
    end
  end
end
