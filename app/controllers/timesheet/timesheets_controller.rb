class Timesheet::TimesheetsController < ApplicationController
  

  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheet/timesheets
  # GET /timesheet/timesheets.json
  def index
    @timesheets = Timesheet::Timesheet.all
  end

  # GET /timesheet/timesheets/1
  # GET /timesheet/timesheets/1.json
  def show
  end

  # GET /timesheet/timesheets/new
  def new
    @timesheet = Timesheet::Timesheet.new
  end

  # GET /timesheet/timesheets/1/edit
  def edit
  end

  # POST /timesheet/timesheets
  # POST /timesheet/timesheets.json
  def create
    @timesheet = Timesheet::Timesheet.new(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheet/timesheets/1
  # PATCH/PUT /timesheet/timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheet/timesheets/1
  # DELETE /timesheet/timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet::Timesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      params.require(:timesheet_timesheet).permit(:field_ticket_id, :site_supervisor_id, :crew_chief_id, :finalized, :project, :supplies_teeth, :supplies_oil, :supplies_holders, :supplies_other, :left_job_at)
    end
end
