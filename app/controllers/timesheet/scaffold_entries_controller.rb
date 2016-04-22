class Timesheet::ScaffoldEntriesController < ApplicationController
  before_action :set_timesheet_scaffold_entry, only: [:show, :edit, :update, :destroy]

  # GET /timesheet/scaffold_entries
  # GET /timesheet/scaffold_entries.json
  def index
    @timesheet_scaffold_entries = Timesheet::ScaffoldEntry.all
  end

  # GET /timesheet/scaffold_entries/1
  # GET /timesheet/scaffold_entries/1.json
  def show
  end

  # GET /timesheet/scaffold_entries/new
  def new
    @timesheet_scaffold_entry = Timesheet::ScaffoldEntry.new
  end

  # GET /timesheet/scaffold_entries/1/edit
  def edit
  end

  # POST /timesheet/scaffold_entries
  # POST /timesheet/scaffold_entries.json
  def create
    @timesheet_scaffold_entry = Timesheet::ScaffoldEntry.new(timesheet_scaffold_entry_params)

    respond_to do |format|
      if @timesheet_scaffold_entry.save
        format.html { redirect_to @timesheet_scaffold_entry, notice: 'Scaffold entry was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet_scaffold_entry }
      else
        format.html { render :new }
        format.json { render json: @timesheet_scaffold_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheet/scaffold_entries/1
  # PATCH/PUT /timesheet/scaffold_entries/1.json
  def update
    respond_to do |format|
      if @timesheet_scaffold_entry.update(timesheet_scaffold_entry_params)
        format.html { redirect_to @timesheet_scaffold_entry, notice: 'Scaffold entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet_scaffold_entry }
      else
        format.html { render :edit }
        format.json { render json: @timesheet_scaffold_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheet/scaffold_entries/1
  # DELETE /timesheet/scaffold_entries/1.json
  def destroy
    @timesheet_scaffold_entry.destroy
    respond_to do |format|
      format.html { redirect_to timesheet_scaffold_entries_url, notice: 'Scaffold entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet_scaffold_entry
      @timesheet_scaffold_entry = Timesheet::ScaffoldEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_scaffold_entry_params
      params.require(:timesheet_scaffold_entry).permit(:timesheet_id, :equipment_id, :fuel_gallons, :mileage_start, :mileage_end)
    end
end
