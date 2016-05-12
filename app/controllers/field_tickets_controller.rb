class FieldTicketsController < ApplicationController
  before_action :set_field_ticket, only: [
    :show,
    :edit,
    :update,
    :destroy,
    
    :job,
    :delays,
    :supplies,
    :dimensions,
    :approval,
    :approve,
    :disapprove,
    
    :vehicles,
    :vehicles_add,
    :vehicles_create,
    :vehicles_update,
    :vehicles_log,
    :vehicles_refuel,
    
    :employees,
    :employees_add,
    :employees_create,
    :employees_update,
    :employees_log,
  ]
  
  autocomplete :job, :internal_number, limit: 50, display_value: :to_s
  
  autocomplete :equipment, :internal_number, limit: 50, display_value: :to_s

  autocomplete :employee, :name, limit: 50, display_value: :to_s

  # GET /field_tickets
  # GET /field_tickets.json
  def index
    @field_tickets = FieldTicket.all
  end

  # GET /field_tickets/1
  # GET /field_tickets/1.json
  def show
    redirect_to field_ticket_job_path(@field_ticket)
  end
  
  ###
  
  def approval
    @minimal_ui = true
    
    #raise @field_ticket.customer_approved_work.inspect
    if @field_ticket.customer_approved_work === nil
      render 'approval_question'
    elsif @field_ticket.customer_approved_work === false
      render 'approval_no'
    else
      render 'approval_yes'
    end
  end
  
  # PATCH customer is satisfied, or not, or reset
  def approve
    new_status = case params[:new_status]
    when 'reset'
      nil
    when 'approve'
      true
    when 'disapprove'
      false
    end
    
    @field_ticket.update(customer_approved_work: new_status)
    redirect_to field_ticket_approval_path(@field_ticket)
  end
  
  ###
  
  def employees_add
    @employee_entry = EmployeeEntry.new(field_ticket: @field_ticket)
  end
  
  def employees_create
    @employee_entry = EmployeeEntry.new(field_ticket: @field_ticket)
    @employee_entry.update(employee_entry_params)
    
    if @employee_entry.save
      redirect_to field_ticket_employees_path(@field_ticket)
    else
      render :employees_add
    end
  end
  
  def employees_update
    if EmployeeEntry::STATUS_TYPES.include? params[:new_status]
      old_employee_entry = EmployeeEntry.find params[:employee_entry_id]
      
      ps = {
        field_ticket_id: params[:field_ticket_id],
        employee_id: old_employee_entry.employee_id,
        status: params[:new_status]
      }
      
      flash[:notice] = "#{old_employee_entry} marked ‘#{ps[:status].humanize}’"
      
      new_employee_entry = EmployeeEntry.create(ps)
      
      redirect_to field_ticket_employees_path(@field_ticket)
    else
      raise 'Bad status'
    end
  end
  
  def employees_log
    this_entry = EmployeeEntry.find params[:employee_entry_id]
    
    @employee_entries = EmployeeEntry.where(
      field_ticket_id: params[:field_ticket_id],
      employee_id: this_entry.employee_id,
    )
  end
  
  ###
  
  def vehicles
    
  end
  
  def vehicles_add
    @equipment_entry = EquipmentEntry.new(field_ticket: @field_ticket)
  end
  
  def vehicles_create
    @equipment_entry = EquipmentEntry.new(field_ticket: @field_ticket)
    @equipment_entry.update(equipment_entry_params)
    
    if @equipment_entry.save
      redirect_to field_ticket_vehicles_path(@field_ticket)
    else
      render :vehicles_add
    end
  end
  
  def vehicles_refuel
    old_equipment_entry = EquipmentEntry.find params[:equipment_entry_id]
    
    @equipment_entry = EquipmentEntry.new(
      field_ticket: @field_ticket,
      equipment_id: old_equipment_entry.equipment_id,
      rental_description: old_equipment_entry.rental_description,
      rental: old_equipment_entry.rental,
      status: 'refuel'
    )
  end
  
  def vehicles_update
    if EquipmentEntry::STATUS_TYPES.include? params[:new_status]
      old_equipment_entry = EquipmentEntry.find params[:equipment_entry_id]
      
      ps = {
        field_ticket_id: params[:field_ticket_id],
        equipment_id: old_equipment_entry.equipment_id,
        rental_description: old_equipment_entry.rental_description,
        rental: old_equipment_entry.rental,
        status: params[:new_status]
      }
      
      if params[:new_status] == 'refuel'
        ps[:mileage] = params[:equipment_entry][:mileage].gsub(',', '')
        ps[:fuel_gallons] = params[:equipment_entry][:fuel_gallons]
        flash[:notice] = "#{old_equipment_entry} filled with #{ps[:fuel_gallons]} gallons of fuel"
      else
        flash[:notice] = "#{old_equipment_entry} marked ‘#{ps[:status].humanize}’"
      end
      
      new_equipment_entry = EquipmentEntry.create(ps)
      
      redirect_to field_ticket_vehicles_path(@field_ticket)
    else
      raise 'Bad status'
    end
  end
  
  def vehicles_log
    this_entry = EquipmentEntry.find params[:equipment_entry_id]
    
    @equipment_entries = EquipmentEntry.where(
      field_ticket_id: params[:field_ticket_id],
      equipment_id: this_entry.equipment_id,
      rental_description: this_entry.rental_description,
      rental: this_entry.rental
    )
    
  end
  

  # GET /field_tickets/new
  def new
    @field_ticket = FieldTicket.create
    redirect_to @field_ticket
  end

  # GET /field_tickets/1/edit
  def edit
  end

  # POST /field_tickets
  # POST /field_tickets.json
  def create
    @field_ticket = FieldTicket.new(field_ticket_params)

    respond_to do |format|
      if @field_ticket.save
        format.html { redirect_to @field_ticket, notice: 'Field ticket was successfully created.' }
        format.json { render :show, status: :created, location: @field_ticket }
      else
        format.html { render :new }
        format.json { render json: @field_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_tickets/1
  # PATCH/PUT /field_tickets/1.json
  def update
    respond_to do |format|
      if @field_ticket.update(field_ticket_params)
        format.html { redirect_to request.referrer, notice: 'Field ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_ticket }
      else
        format.html { render :edit }
        format.json { render json: @field_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_tickets/1
  # DELETE /field_tickets/1.json
  def destroy
    @field_ticket.destroy
    respond_to do |format|
      format.html { redirect_to field_tickets_url, notice: 'Field ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def equipment_entry_params
      params.require(:equipment_entry).permit(
        :rental,
        :equipment_id,
        :rental_description,
        :mileage,
      )
    end
    
    def employee_entry_params
      params.require(:employee_entry).permit(
        :employee_id,
      )
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_field_ticket
      @field_ticket = FieldTicket.find(params[:field_ticket_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_ticket_params
      params.require(:field_ticket).permit(
        :job_id,
        :bill_to,
        
        :started_at,
        :finished_at,
        
        :customer_approved_work,
        :customer_name_and_title,
        :customer_signature,
        
        :length,
        :width,
        :depth,
        
        :supplies_teeth,
        :supplies_oil,
        :supplies_holders,
        :supplies_other,
        
        :delays_trucks,
        :delays_paving,
        :delays_mot,
        :delays_other,
      )
    end
end
