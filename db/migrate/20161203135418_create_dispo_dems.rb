class CreateDispoDems < ActiveRecord::Migration[5.0]
  def change
    create_table :dispo_dems do |t|
      t.integer :dem_id
      t.date :date

      t.timestamps
    end
  end
end
