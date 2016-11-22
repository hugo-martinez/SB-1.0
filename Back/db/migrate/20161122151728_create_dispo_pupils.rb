class CreateDispoPupils < ActiveRecord::Migration[5.0]
  def change
    create_table :dispo_pupils do |t|
      t.string :pupil_id
      t.string :integer
      t.date :date

      t.timestamps
    end
  end
end
