require 'fx_datetime'

class FieldTicket < ActiveRecord::Base
  belongs_to :job
  
  has_many :equipment_entries
  has_many :employee_entries
  
  BILLING_TYPES = ['Job', 'Cancelled Job', ['-', 'data-divider' => 'true'], 'Weather', 'Overhead', 'Office Staff', 'Transport', 'Equipment Maintenance & Repair']
  
  has_attached_file :customer_signature,
    styles: {
      thumb: "150x300>",
      normal: "1000x1000>"
    }
  validates_attachment_content_type :customer_signature, content_type: /\Aimage\/.*\Z/
  
  before_save :erase_job_if_not_needed
  
  def reference_name
    id
  end
  
  def model_reference_name
    "#{humanize} # #{reference_name}"
  end
  
  def square_yards
    if length.to_i > 0 and width.to_i > 0
      (length * width).to_i
    end
  end
  
  def square_yards_human(default = 'Not entered')
    if square_yards
      "#{square_yards} square yards"
    else
      default
    end
  end
  
  def requires_job_number
    ['Job', 'Cancelled Job'].include? bill_to
  end
  
  ###
  
  def job_employee_list_unsorted
    if job
      @employee_list ||= job.employee_entries.unscoped.select('DISTINCT ON (employee_id) *')
    else
      @employee_list ||= []
    end
  end
  
  def job_employee_list
    if not @job_employee_list
      @job_employee_list = {
        idle: [],
        overhead: [],
        on_the_job: []
      }
      
      job_employee_list_unsorted.each do |list_item|
        result = employee_entries.where(
          employee_id: list_item.employee_id
        ).last
        
        if not result
          result = EmployeeEntry.create(
            field_ticket: self,
            employee_id: list_item.employee_id
          )
        end
        
        @job_employee_list[result.status.to_sym] << result
      end
    end
    
    @job_employee_list
  end
  
  ###
  
  def job_equipment_list
    if job
      @job_equipment_list ||= job.equipment_entries.unscoped.select('DISTINCT ON (equipment_id, rental_description, rental) *')
    else
      @job_equipment_list ||= []
    end
  end
  
  def equipment_on_the_job
    sort_job_equipment_list if not @on_the_job
    @on_the_job
  end
  
  def equipment_in_maintenance
    sort_job_equipment_list if not @in_maintenance
    @in_maintenance
  end
  
  def equipment_idle
    sort_job_equipment_list if not @idle
    @idle
  end
  
  ###
  
  def sidebar_descriptions
    if not @sidebar_descriptions
      
      @sidebar_descriptions = {
      }
      
      @sidebar_descriptions[:job] = if job == nil
        bill_to.humanize
      else
        "#{bill_to.humanize} ##{job.internal_number}"
      end
      
      
      
      working_count = (equipment_on_the_job.count + equipment_in_maintenance.count)
      
      idle_count = equipment_idle.count
      
      @sidebar_descriptions[:vehicles] = if working_count > 0 and idle_count > 0
        "#{working_count} in use, #{idle_count} idle"
      elsif working_count > 0
        "#{working_count} in use"
      elsif idle_count > 0
        "#{idle_count} idle"
      else
        'No vehicles added'
      end
      
      
      
      working_count = job_employee_list[:on_the_job].count + job_employee_list[:overhead].count
      
      idle_count = job_employee_list[:idle].count
      
      @sidebar_descriptions[:employees] = if working_count > 0 and idle_count > 0
        "#{working_count} working, #{idle_count} idle"
      elsif working_count > 0
        "#{working_count} working"
      elsif idle_count > 0
        "#{idle_count} idle"
      else
        'No employees added'
      end
            
      
      
      
      @sidebar_descriptions[:dimensions] = if square_yards and depth
        "#{square_yards} sq. yd. × #{depth} in."
      else
        'Not entered'
      end
            
      
      
      
      arr = []
      arr << 'teeth' if not supplies_teeth.blank?
      arr << 'oil' if not supplies_oil.blank?
      arr << 'holders' if not supplies_holders.blank?
      arr << 'other' if not supplies_other.blank?
      
      @sidebar_descriptions[:supplies] = if arr.count > 0
        arr.join(', ').humanize
      else
        'None used'
      end
            
      
      
      
      arr = []
      arr << 'trucks' if not delays_trucks.blank?
      arr << 'paving' if not delays_paving.blank?
      arr << 'MOT' if not delays_mot.blank?
      arr << 'other' if not delays_other.blank?
      
      @sidebar_descriptions[:delays] = if arr.count > 0
        str = arr.join(', ')
        str.slice(0,1).capitalize + str.slice(1..-1)
      else
        'None'
      end
      
      
      
      @sidebar_descriptions[:approval] = case customer_approved_work
      when true
        'Approved'
      when false
        'Disapproved'
      else
        'Not yet approved'
      end
      
      
    end
    
    @sidebar_descriptions
  end
  
  private
  
    # Goes through the list of equipment entries and creates three instance variables for each category of equipment entry. I'm sure there's a much more database-efficient way of doing this, but I don't know it.
    def sort_job_equipment_list
      @idle = []
      @in_maintenance = []
      @on_the_job = []
    
    
      job_equipment_list.each do |list_item|
        result = equipment_entries.where(
          equipment_id: list_item.equipment_id,
          rental_description: list_item.rental_description,
          rental: list_item.rental
        ).where.not(
          status: 'refuel'
        ).last
      
        if not result
          # first time it's been viewed, so create a new DB entry for this idle equipment
          @idle << EquipmentEntry.create(
            field_ticket: self,
            equipment_id: list_item.equipment_id,
            rental_description: list_item.rental_description,
            rental: list_item.rental
          )
  
        elsif result.status == 'idle'
          @idle << result

        elsif result.status == 'in_maintenance'
          @in_maintenance << result

        elsif result.status == 'on_the_job'
          @on_the_job << result
        
        end
      end
    
      true
    end
  
    def erase_job_if_not_needed
      if not requires_job_number
        self.job = nil
      end
    end
  
end
