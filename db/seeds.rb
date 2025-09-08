# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Limpieza de datos (opcional pero recomendado en desarrollo)
# Lo puse porque me cambiaba el id caa vez que corrian las seed
[Room, Guest, Reservation, Service, ServiceUsage, Invoice].each do |model|
  model.delete_all
  ActiveRecord::Base.connection.reset_pk_sequence!(model.table_name)
end

# CREAMOS SEEDS PARA LAS HABITACIONES - TABLA ROOM
# room_type: 0 = single, 1 = double, 2 = suite
# status: 0 = available, 1 = occupied, 2 = maintenance, 3 = cleaning
Room.create(number: "100", room_type: 2, price: 200000, status: 0)
Room.create(number: "101", room_type: 2, price: 200000, status: 1)
Room.create(number: "102", room_type: 0, price: 80000, status: 2)
Room.create(number: "103", room_type: 0, price: 80000, status: 0)
Room.create(number: "104", room_type: 0, price: 80000, status: 0)
Room.create(number: "105", room_type: 0, price: 80000, status: 0)
Room.create(number: "106", room_type: 0, price: 80000, status: 3)
Room.create(number: "107", room_type: 1, price: 150000, status: 1)
Room.create(number: "108", room_type: 1, price: 150000, status: 2)
Room.create(number: "109", room_type: 1, price: 150000, status: 0)
Room.create(number: "110", room_type: 1, price: 150000, status: 0)
Room.create(number: "310", room_type: 2, price: 300000, status: 0)

Guest.create!([
  { first_name: "Ana", last_name: "Pérez", email: "ana@example.com", phone: "+56911111111", document_id: "12.345.678-9" },
  { first_name: "Juan", last_name: "Soto", email: "juan@example.com", phone: "+56922222222", document_id: "20.619.539-8" },
  { first_name: "María", last_name: "Gómez", email: "maria@example.com", phone: "+56933333333", document_id: "18.765.432-1" },
  { first_name: "Pedro", last_name: "Ramírez", email: "pedro@example.com", phone: "+56944444444", document_id: "7.654.321-0" }
])


# -----------------------------
# Reservations 
# Reservation: 0=pending, 1=confirmed, 2=checked_in, 3=checked_out, 4=canceled.
# -----------------------------
Reservation.create!([
  {
    code: "RSV-2025-0001",
    guest_id: 123456789,
    room_id: 109,
    check_in: Date.new(2025, 9, 10),
    check_out: Date.new(2025, 9, 12),
    status: 1,   # confirmed
    adults: 2,
    children: 0
  },
  {
    code: "RSV-2025-0002",
    guest_id: 206195398,
    room_id: 107,
    check_in: Date.new(2025, 9, 6),
    check_out: Date.new(2025, 9, 9),
    status: 2,   # checked_in
    adults: 2,
    children: 0
  },
  {
    code: "RSV-2025-0003",
    guest_id: 187654321,
    room_id: 103,
    check_in: Date.new(2025, 9, 20),
    check_out: Date.new(2025, 9, 22),
    status: 0,   # pending
    adults: 1,
    children: 0
  }
])


# -----------------------------
# Services de ejemplo
# -----------------------------
Service.create!([
  { name: "Minibar", price: 8000, is_active: true },
  { name: "Lavandería", price: 6000, is_active: true },
  { name: "Room Service", price: 12000, is_active: true },
  { name: "Jacuzzi Privado", price: 15000, is_active: false } # ejemplo desactivado
])

# # -----------------------------
# # ServiceUsage
# # -----------------------------
ServiceUsage.create!([
  {
    reservation_id: 1,      # RSV-2025-0001
    service_id: 1,          # Minibar
    quantity: 3,
    used_at: DateTime.new(2025, 9, 11, 21, 30),
    note: "2 aguas y 1 snack"
  },
  {
    reservation_id: 2,      # RSV-2025-0002
    service_id: 2,          # Lavandería
    quantity: 2,
    used_at: DateTime.new(2025, 9, 7, 10, 00),
    note: "2 camisas lavadas"
  },
  {
    reservation_id: 3,      # RSV-2025-0003
    service_id: 4,          # Piscina
    quantity: 1,
    used_at: DateTime.new(2025, 9, 20, 15, 00),
    note: "Acceso por un día"
  }
])

# -----------------------------
# Invoices
# -----------------------------
Invoice.create!([
  {
    reservation_id: 1,                  # RSV-2025-0001
    nights_subtotal: 2 * 200000,        # 2 noches × $200.000 (ejemplo)
    services_subtotal: 3 * 8000,        # 3 consumos de Minibar
    tax: ((2 * 200000 + 3 * 8000) * 0.19).to_i,
    total: (2 * 200000 + 3 * 8000) + ((2 * 200000 + 3 * 8000) * 0.19).to_i,
    issued_at: DateTime.new(2025, 9, 12, 11, 00),
    status: "issued"
  },
  {
    reservation_id: 2,                  # RSV-2025-0002
    nights_subtotal: 3 * 150000,        # 3 noches × $150.000 (ejemplo)
    services_subtotal: 2 * 6000,        # 2 Lavanderías
    tax: ((3 * 150000 + 2 * 6000) * 0.19).to_i,
    total: (3 * 150000 + 2 * 6000) + ((3 * 150000 + 2 * 6000) * 0.19).to_i,
    issued_at: DateTime.new(2025, 9, 9, 10, 30),
    status: "paid"
  }
])
