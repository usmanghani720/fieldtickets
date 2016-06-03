class Admin::VehiclesController < Admin::BaseController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  
  decorates_assigned :vehicle

  # GET /vehicle
  # GET /vehicle.json
  def index
    @vehicles = Vehicle.all.decorate
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

    if @vehicle.save
      redirect_to admin_vehicle_path(@vehicle), notice: @vehicle.flash(:create)
    else
      render :new
    end
  end

  # PATCH/PUT /vehicle/1
  # PATCH/PUT /vehicle/1.json
  def update
    if @vehicle.update(vehicle_params)
      redirect_to admin_vehicle_path(@vehicle), notice: @vehicle.flash(:update)
    else
      render :edit
    end
  end

  # DELETE /vehicle/1
  # DELETE /vehicle/1.json
  def destroy
    @vehicle.destroy
    redirect_to admin_vehicles_path, notice: @vehicle.flash(:destroy)
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
