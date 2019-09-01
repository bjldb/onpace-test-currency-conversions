class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.string :convert_from
      t.string :convert_to
      t.float :rate, default: 0.0
      t.datetime :fetch_time

      t.timestamps
    end
    add_index :conversions, [:convert_from, :convert_to], :unique => true
  end
end
