class Ticket::VehicleMailer < ApplicationMailer
  def ticket_vehicle_email(ticket_vehicle)
    @vehicle = ticket_vehicle
    driver_email = Employee.find(@vehicle.driver.to_i).email
    manager_or_chief_email = Employee.find(@vehicle.crew_chief.to_i).email
    mail(to: [driver_email,manager_or_chief_email], subject: "Vehicle Information for Ticket")
  end
end
