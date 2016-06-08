Customer.create!([
  {name: 'Acme Construction'},
  {name: 'Florida DOT'},
])

Employee.create!([
  {name: 'John Appleseed', role: :worker},
  {name: 'Kevin Jones', role: :worker},
  {name: 'Emily Langer', role: :worker},
  {name: 'Joe Walker', role: :worker},
  {
    name: 'Mike Smith',
    role: :crew_chief,
    email: 'mike@fluffyx.com',
    password: 'goat',
  },
  {
    name: 'Oliver Anson',
    role: :manager,
    email: 'oliver@fluffyx.com',
    password: 'goat',
  },
])

Vehicle.create!([
  {internal_number: '007', vehicle_type: :truck},
  {internal_number: '032', vehicle_type: :mill},
])

Job.create!([
  {internal_number: '12345', customer_id: 1, billing: 1, pay_rate: 1},
  {internal_number: '54321', customer_id: 2, billing: 2, pay_rate: 1},
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