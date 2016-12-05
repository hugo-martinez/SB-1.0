class CreateKeywordCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :keyword_courses do |t|
      t.integer :course_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
