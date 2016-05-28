class Admin::VehiclesController < Admin::BaseController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicle
  # GET /vehicle.json
  def index
    @vehicle = Vehicle.all
  end

  # GET /vehicle/1
  # GET /vehicle/1.json
  def show
  end

  # GET /vehicle/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicle/1/edit
  def edit
  end

  # POST /vehicle
  # POST /vehicle.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to admin_vehicle_path(@vehicle), notice: @vehicle.flash(:create) }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle/1
  # PATCH/PUT /vehicle/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to admin_vehicle_path(@vehicle), notice: @vehicle.flash(:update) }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle/1
  # DELETE /vehicle/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to admin_vehicles_path, notice: @vehicle.flash(:destroy) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:internal_number, :license_plate_number, :vin, :vehicle_type, :description)
    end
end
