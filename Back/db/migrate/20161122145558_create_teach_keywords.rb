class CreateTeachKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :teach_keywords do |t|
      t.string :teach_id
      t.string :integer
      t.string :keyword
      t.string :string

      t.timestamps
    end
  end
end
