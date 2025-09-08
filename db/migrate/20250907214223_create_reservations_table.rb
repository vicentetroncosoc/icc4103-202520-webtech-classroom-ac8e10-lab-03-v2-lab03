class CreateReservationsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.string :code, null: false
      t.integer :guest_id, null: false
      t.integer :room_id, null: false
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :status, null: false
      t.integer :adults, null: false
      t.integer :children, null: false
      t.timestamps
    end
  end
end
