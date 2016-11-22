class CreateDispoTeaches < ActiveRecord::Migration[5.0]
  def change
    create_table :dispo_teaches do |t|
      t.string :teach_id
      t.string :integer
      t.date :date

      t.timestamps
    end
  end
end
