class CreatePupilKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :pupil_keywords do |t|
      t.string :pupil_id
      t.string :integer
      t.string :keyword
      t.string :string

      t.timestamps
    end
  end
end
