class Ticket::EmployeesController < Ticket::BaseController
  def index
  end
  
  def new
    blank_ticket_employee
  end
  
  def create
    blank_ticket_employee
    @ticket_employee.update(ticket_employee_params)
    
    if @ticket_employee.save
      redirect_to ticket_employees_path(@ticket)
    else
      render :new
    end
  end
  
  private
  
    def blank_ticket_employee
      @ticket_employee = Ticket::Employee.new(ticket: @ticket)
    end
    
    def ticket_employee_params
      params.require(:ticket_employee).permit(
        :employee_id,
      )
    end
end
