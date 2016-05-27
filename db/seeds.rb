Customer.create!([
  {name: 'Acme Construction'},
  {name: 'Florida DOT'},
])

Employee.create!([
  {name: 'John Appleseed'},
  {name: 'Kevin Jones'},
  {name: 'Emily Langer'},
  {name: 'Mike Smith'},
  {name: 'Joe Walker'},
  {
    name: 'Oliver Anson',
    email: 'oliver@fluffyx.com',
    encrypted_password: '$2a$10$2uB..Revw3TAjgcpDTYBmuPkbFZrl3Ym1L5VSQjmAOto2LieOBY6.',
    manager: true,
  },
])

Vehicle.create!([
  {internal_number: '007', vehicle_type: 'Truck'},
  {internal_number: '032', vehicle_type: 'Mill'},
])

Job.create!([
  {internal_number: '12345', customer_id: 1, billing: 1},
  {internal_number: '54321', customer_id: 2, billing: 2},
])
# 
# FieldTicket.create!([
#   {job_id: 1},
#   {job_id: 1},
#   {job_id: 2},
#   {bill_to: 'Equipment Maintenance & Repair'},
# ])

Ticket::Ticket.create!([
  {job_id: 1},
  {job_id: 1},
  {job_id: 2},
  {bill_to: :shop},
])

# EmployeeEntry.create!([
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "idle", created_at: Time.parse("2016-05-15 06:01:00")
#   },
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "on_the_job", created_at: Time.parse("2016-05-15 06:28:00")
#   },
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "idle", created_at: Time.parse("2016-05-15 12:13:00")
#   },
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "on_the_job", created_at: Time.parse("2016-05-15 1:15:00")
#   },
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "overhead", created_at: Time.parse("2016-05-15 4:19:00")
#   },
#   {
#     employee_id: 2, field_ticket_id: 1,
#     status: "idle", created_at: Time.parse("2016-05-15 4:30:00")
#   },
# ])
# 