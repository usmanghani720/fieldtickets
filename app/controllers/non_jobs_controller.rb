class NonJobsController < ApplicationController
  before_action :set_non_job, only: [:show, :edit, :update, :destroy]

  # GET /non_jobs
  # GET /non_jobs.json
  def index
    @non_jobs = NonJob.all
  end

  # GET /non_jobs/1
  # GET /non_jobs/1.json
  def show
  end

  # GET /non_jobs/new
  def new
    @non_job = NonJob.new
  end

  # GET /non_jobs/1/edit
  def edit
  end

  # POST /non_jobs
  # POST /non_jobs.json
  def create
    @non_job = NonJob.new(non_job_params)

    respond_to do |format|
      if @non_job.save
        format.html { redirect_to @non_job, notice: 'Non job was successfully created.' }
        format.json { render :show, status: :created, location: @non_job }
      else
        format.html { render :new }
        format.json { render json: @non_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_jobs/1
  # PATCH/PUT /non_jobs/1.json
  def update
    respond_to do |format|
      if @non_job.update(non_job_params)
        format.html { redirect_to @non_job, notice: 'Non job was successfully updated.' }
        format.json { render :show, status: :ok, location: @non_job }
      else
        format.html { render :edit }
        format.json { render json: @non_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_jobs/1
  # DELETE /non_jobs/1.json
  def destroy
    @non_job.destroy
    respond_to do |format|
      format.html { redirect_to non_jobs_url, notice: 'Non job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_job
      @non_job = NonJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def non_job_params
      params.require(:non_job).permit(:name)
    end
end
