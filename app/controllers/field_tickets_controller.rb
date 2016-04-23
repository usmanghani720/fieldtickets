class FieldTicketsController < ApplicationController
  before_action :set_field_ticket, only: [:show, :edit, :update, :destroy, :job]
  autocomplete :job, :internal_number, full: false, limit: 50

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
  
  def job
  end

  # GET /field_tickets/new
  def new
    @field_ticket = FieldTicket.new
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
        format.html { redirect_to @field_ticket, notice: 'Field ticket was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_field_ticket
      @field_ticket = FieldTicket.find(params[:field_ticket_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_ticket_params
      params.require(:field_ticket).permit(:job_id, :non_job_id, :started_at, :finished_at, :customer_approved_work, :customer_name_and_title, :customer_signature)
    end
end
