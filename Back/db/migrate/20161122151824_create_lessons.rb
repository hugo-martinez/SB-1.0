class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :teach_id
      t.string :integer
      t.string :pupil_id
      t.string :integer
      t.date :date
      t.string :cost
      t.string :integer
      t.string :status
      t.string :integer

      t.timestamps
    end
  end
end
