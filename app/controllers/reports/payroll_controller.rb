require 'fx_datetime'

class Reports::PayrollController < ApplicationController
  def show
    @start = params[:start]
    @end = params[:end]
    @start ||= '6 days ago'
    @end ||= 'today'
    @start = @start.to_time_with_chronic
    @end = @end.to_time_with_chronic
    @start.change(hour: 0, min: 0)
    @end.change(hour: 23, min: 59, sec: 59)
    
    #
    
    @employees = {}
    @employee_entries = EmployeeEntry.where(time: @start..@end)
    
    @employee_entries.each do |entry|
      @employees[entry.employee_id] ||= {
        name: entry.employee.to_s,
        duration_day: 0,
        duration_night: 0,
        duration_total: 0
      }
      
      if entry.status != 'idle'
        @employees[entry.employee_id][:duration_day] += entry.duration_day
        @employees[entry.employee_id][:duration_night] += entry.duration_night
        @employees[entry.employee_id][:duration_total] += entry.duration_total
      end
        
    end
    
    
  end
end
