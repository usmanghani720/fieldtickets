class Timesheet::EmployeeEntriesController < ApplicationController
  before_action :set_timesheet_employee_entry, only: [:show, :edit, :update, :destroy]

  # GET /timesheet/employee_entries
  # GET /timesheet/employee_entries.json
  def index
    @timesheet_employee_entries = Timesheet::EmployeeEntry.all
  end

  # GET /timesheet/employee_entries/1
  # GET /timesheet/employee_entries/1.json
  def show
  end

  # GET /timesheet/employee_entries/new
  def new
    @timesheet_employee_entry = Timesheet::EmployeeEntry.new
  end

  # GET /timesheet/employee_entries/1/edit
  def edit
  end

  # POST /timesheet/employee_entries
  # POST /timesheet/employee_entries.json
  def create
    @timesheet_employee_entry = Timesheet::EmployeeEntry.new(timesheet_employee_entry_params)

    respond_to do |format|
      if @timesheet_employee_entry.save
        format.html { redirect_to @timesheet_employee_entry, notice: 'Employee entry was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet_employee_entry }
      else
        format.html { render :new }
        format.json { render json: @timesheet_employee_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheet/employee_entries/1
  # PATCH/PUT /timesheet/employee_entries/1.json
  def update
    respond_to do |format|
      if @timesheet_employee_entry.update(timesheet_employee_entry_params)
        format.html { redirect_to @timesheet_employee_entry, notice: 'Employee entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet_employee_entry }
      else
        format.html { render :edit }
        format.json { render json: @timesheet_employee_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheet/employee_entries/1
  # DELETE /timesheet/employee_entries/1.json
  def destroy
    @timesheet_employee_entry.destroy
    respond_to do |format|
      format.html { redirect_to timesheet_employee_entries_url, notice: 'Employee entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet_employee_entry
      @timesheet_employee_entry = Timesheet::EmployeeEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_employee_entry_params
      params.require(:timesheet_employee_entry).permit(:timesheet_id, :employee_id, :start_at, :end_at, :minutes_worked, :boolean)
    end
end
