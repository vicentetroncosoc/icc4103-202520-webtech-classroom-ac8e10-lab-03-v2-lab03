class CreateInvoicesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.integer  :reservation_id    # a qué reserva pertenece la factura
      t.integer  :nights_subtotal   # subtotal = noches × tarifa habitación
      t.integer  :services_subtotal # subtotal de todos los servicios consumidos
      t.integer  :tax               # IVA (19% del subtotal)
      t.integer  :total             # monto total a pagar (subtotales + IVA)
      t.datetime :issued_at         # fecha/hora en que se emite la factura
      t.string   :status            # estado de la factura (issued, paid, void, etc.)    
      t.timestamps
    end
  end
end
