class Ticket::EmployeesController < Ticket::BaseController
  # Show the Employees on this Ticket
  def index
  end
  
  # Show the form to add an Employee to this Ticket
  def new
    blank_ticket_employee
  end
  
  # Add an Employee to this Ticket
  def create
    blank_ticket_employee
    @ticket_employee.update(ticket_employee_params)
    
    if @ticket_employee.save
      redirect_to ticket_employees_path(@ticket)
    else
      render :new
    end
  end
  
  # Add a new EmployeeEntry to change an Employee's status
  def create_status
    set_employee
    
    @employee.status = params[:status]
    
    flash[:notice] = "#{@employee} marked ‘#{params[:status].titleize}’"
    redirect_to ticket_employees_path(@ticket)
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
    
    def set_employee
      @employee = Ticket::Employee.find(params[:employee_id])
    end
end
