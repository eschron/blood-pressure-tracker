class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.datetime :time
      t.integer :systolic
      t.integer :diastolic
      t.string :notes

      t.belongs_to :user

      t.timestamps
    end
  end
end
