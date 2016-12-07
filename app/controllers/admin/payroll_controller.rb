class Admin::PayrollController < ApplicationController
  before_action :set_payroll_period, only: [:show]
  
  def index
    @payroll_periods = PayrollPeriod.all
    
    @pending_tickets = PayrollPeriod.available_tickets
  end

  def show
    @entries = @payroll_period.summarized_entries
    @per_diems = @payroll_period.per_diems
    #raise @payroll_period.valid_entries.unscoped.inspect
  end
  
  def add_pending_tickets
    pp = PayrollPeriod.new
    pp.autoselect_all_possible_entries!
    pp.calculate!
    redirect_to admin_payroll_path(pp)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_period
      @payroll_period = PayrollPeriod.find(params[:id])
    end
end
