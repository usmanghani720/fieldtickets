Customer.create!([
  {name: 'Acme Construction'},
  {name: 'Florida DOT'}
])

Employee.create!([
  {name: 'John Doe'},
  {name: 'Mark Twain'},
  {name: 'Vince Smith'}
])

Equipment.create!([
  {internal_number: '007', vehicle_type: 'Truck'},
  {internal_number: '032', vehicle_type: 'Mill'}
])

Job.create!([
  {internal_number: '12345', customer_id: 1}
])

FieldTicket.create!([
  {job_id: 1}
])