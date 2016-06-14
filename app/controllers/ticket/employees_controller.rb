class Ticket::EmployeesController < Ticket::BaseController
  before_action :set_employee, only: [:show, :create_status, :edit_status, :update_status, :delete_status, :per_diem_toggle]
  
  before_action :set_ticket, except: :autocomplete_employee_display_name
  
  autocomplete :employee, :display_name, limit: 50, full: true, scopes: [:worker]
  
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
  
  # Show the timeclock log
  def show
    @entries = @employee.entries.decorate
    @entries_deleted = @employee.entries.only_deleted
  end
  
  # Add a new EmployeeEntry to change an Employee's status
  def create_status
    @employee.status = params[:status]
    
    flash[:notice] = "#{@employee} marked ‘#{params[:status].titleize}’"
    redirect_to ticket_employees_path(@ticket)
  end
  
  # Show the form to edit a status
  def edit_status
    @entries = @employee.entries
    @entries = @entries.decorate
    @entries_deleted = @employee.entries.only_deleted
    
    @entry_id = params[:employee_entry_id].to_i
    render :edit_status
  end
  
  # Post the changes of an edited status
  def update_status
    @employee_entry = Ticket::EmployeeEntry.find params[:employee_entry_id]
    
    if @employee_entry.update(ticket_employee_entry_params)
      redirect_to ticket_employee_log_path(@ticket, @employee), notice: 'Your change has been saved.'
    else
      edit_status
    end
  end
  
  # Delete status
  def delete_status
    @employee_entry = Ticket::EmployeeEntry.find params[:employee_entry_id]
    
    @employee_entry.destroy!
    
    redirect_to ticket_employee_log_path(@ticket, @employee), notice: 'That timesheet entry has been deleted.'
  end
  
  # Toggle per diem
  def per_diem_toggle
    @employee.update(per_diem: !@employee.per_diem)
    
    message = if @employee.per_diem
      "#{@employee} will receive per diem for this ticket."
    else
      "#{@employee} will no longer receive per diem for this ticket."
    end
    
    redirect_to ticket_employee_log_path(@ticket, @employee), notice: message
  end
  
  private
    
    # Provides a new @ticket_employee attached to this ticket
    def blank_ticket_employee
      @ticket_employee = @ticket.employees.new
    end
    
    # The only field we need to make a new ticket_employee is employee_id
    def ticket_employee_params
      params.require(:ticket_employee).permit(
        :employee_id,
        :per_diem,
      )
    end
    
    # For editing
    def ticket_employee_entry_params
      params.require(:ticket_employee_entry).permit(
        :status,
        :time,
        :reason_for_edit,
        :manually_edited,
      )
    end
    
    # Read @employee from params
    def set_employee
      @employee = Ticket::Employee.find(params[:employee_id])
    end
end
