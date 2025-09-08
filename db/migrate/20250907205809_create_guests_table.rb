class CreateGuestsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :document_id, null: false
      t.timestamps
    end
  end
end
