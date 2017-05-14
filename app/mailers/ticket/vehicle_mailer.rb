class Ticket::VehicleMailer < ApplicationMailer
  def ticket_vehicle_email(ticket_vehicle)
    @ticket_vehicle = ticket_vehicle
    driver_email = Employee.find(@ticket_vehicle.driver.to_i).email
    manager_or_chief_email = Employee.find(@ticket_vehicle.crew_chief.to_i).email
    mail(to: [driver_email,manager_or_chief_email], subject: "Vehicle Information for Ticket")
  end
end
