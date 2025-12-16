class CreateKadaikanris < ActiveRecord::Migration[8.0]
  def change
    create_table :kadaikanris do |t|
      t.integer :no
      t.date :entrydate
      t.string :reporter
      t.string :location
      t.text :content
      t.text :plan
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
