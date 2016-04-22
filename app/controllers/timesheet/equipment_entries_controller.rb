class Timesheet::EquipmentEntriesController < ApplicationController
  before_action :set_timesheet_equipment_entry, only: [:show, :edit, :update, :destroy]

  # GET /timesheet/equipment_entries
  # GET /timesheet/equipment_entries.json
  def index
    @timesheet_equipment_entries = Timesheet::EquipmentEntry.all
  end

  # GET /timesheet/equipment_entries/1
  # GET /timesheet/equipment_entries/1.json
  def show
  end

  # GET /timesheet/equipment_entries/new
  def new
    @timesheet_equipment_entry = Timesheet::EquipmentEntry.new
  end

  # GET /timesheet/equipment_entries/1/edit
  def edit
  end

  # POST /timesheet/equipment_entries
  # POST /timesheet/equipment_entries.json
  def create
    @timesheet_equipment_entry = Timesheet::EquipmentEntry.new(timesheet_equipment_entry_params)

    respond_to do |format|
      if @timesheet_equipment_entry.save
        format.html { redirect_to @timesheet_equipment_entry, notice: 'Equipment entry was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet_equipment_entry }
      else
        format.html { render :new }
        format.json { render json: @timesheet_equipment_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheet/equipment_entries/1
  # PATCH/PUT /timesheet/equipment_entries/1.json
  def update
    respond_to do |format|
      if @timesheet_equipment_entry.update(timesheet_equipment_entry_params)
        format.html { redirect_to @timesheet_equipment_entry, notice: 'Equipment entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet_equipment_entry }
      else
        format.html { render :edit }
        format.json { render json: @timesheet_equipment_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheet/equipment_entries/1
  # DELETE /timesheet/equipment_entries/1.json
  def destroy
    @timesheet_equipment_entry.destroy
    respond_to do |format|
      format.html { redirect_to timesheet_equipment_entries_url, notice: 'Equipment entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet_equipment_entry
      @timesheet_equipment_entry = Timesheet::EquipmentEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_equipment_entry_params
      params.require(:timesheet_equipment_entry).permit(:timesheet_id, :equipment_id, :fuel_gallons, :mileage_start, :mileage_end)
    end
end
