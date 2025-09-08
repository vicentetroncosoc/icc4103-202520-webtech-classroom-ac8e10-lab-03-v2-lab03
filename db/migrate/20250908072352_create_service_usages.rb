class CreateServiceUsages < ActiveRecord::Migration[8.0]
  def change
    create_table :service_usages do |t|
      t.integer :reservation_id
      t.integer :service_id
      t.integer :quantity
      t.datetime :used_at
      t.text :note

      t.timestamps
    end
  end
end
