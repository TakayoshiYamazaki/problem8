class CreateStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :disp

      t.timestamps
    end
  end
end
