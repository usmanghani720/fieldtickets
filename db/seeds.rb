Customer.create!([
  {name: 'Acme Construction'},
  {name: 'Florida DOT'},
])

Employee.create!([
  {name: "Javier Reyes", role: :worker},
  {name: "Christopher S. Rider", role: :crew_chief},
  {name: "Joshua R. Ryals", role: :crew_chief},
  {name: "Neil R. Sheridan", role: :worker},
  {name: "Daniel T. Ash", role: :manager},
  {name: "Zachary Bomia", role: :worker},
  {name: "Nicholas Calcagio", role: :worker},
  {name: "Hal Chaires", role: :crew_chief},
  {name: "Corey R. Chaney", role: :crew_chief},
  {name: "Jessica Concepcion", role: :manager},
  {name: "Justin Coulter", role: :worker},
  {name: "Blake A. Cox", role: :worker},
  {name: "Yosvani Diaz Caraballo", role: :crew_chief},
  {name: "Ted Dixon", role: :crew_chief},
  {name: "Justin Fisher", role: :worker},
  {name: "Randal Forehand", role: :worker},
  {name: "Anthony Goes", role: :crew_chief},
  {name: "Shawn M. Green", role: :crew_chief},
  {name: "Andrew J. Gross", role: :crew_chief},
  {name: "Michael Heller", role: :worker},
  {name: "Daniel Hoyt", role: :worker},
  {name: "Christopher P. Humbert", role: :worker},
  {name: "Keith A. Jackson", role: :worker},
  {name: "Mitchel Johns", role: :worker},
  {name: "Jay Lanier", role: :worker},
  {name: "Patrick B. McKnight", role: :manager},
  {name: "James C. McLellan", role: :worker},
  {name: "Tyler S. McLellan", role: :worker},
  {name: "Cody Meeks", role: :worker},
  {name: "Jeffrey S. Mixon", role: :manager},
  {name: "Clay S. Morris", role: :manager},
  {name: "Roger Mueller", role: :crew_chief},
  {name: "Lisa Nixon", role: :manager},
  {name: "Michael J. Pelkey", role: :manager},
  {name: "Kristopher Smythe", role: :manager},
  {name: "Shirley Spears", role: :manager},
  {name: "Matthew L. Whitehouse", role: :crew_chief},
  {name: "Paul Wimbley", role: :worker},
  {name: "Brian S. Miller Sr.", role: :manager},
  {name: "Daniel L. Flowers II", role: :worker},
  {name: "Arthur J. Rhoden III", role: :worker},
  {name: "George H. Smith Jr.", role: :manager},
  {name: "Ronnie W. Albritton Jr.", role: :manager},
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