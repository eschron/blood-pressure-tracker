class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.datetime :time, null: false
      t.integer :systolic, null: false
      t.integer :diastolic, null: false
      t.string :notes

      t.belongs_to :user

      t.timestamps
    end
  end
end
