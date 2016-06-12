class Admin::PayrollController < ApplicationController
  before_action :set_payroll_period, only: [:show]
  
  def index
    @payroll_periods = PayrollPeriod.all
  end

  def show
    @entries = @payroll_period.summarized_entries.decorate
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_period
      @payroll_period = PayrollPeriod.find(params[:id])
    end
end
