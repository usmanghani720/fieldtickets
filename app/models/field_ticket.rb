require 'fx_datetime'

class FieldTicket < ActiveRecord::Base
  belongs_to :job
  
  has_many :equipment_entries
  
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
  
  def job_equipment_list
    @job_equipment_list ||= job.equipment_entries.select('DISTINCT equipment_id, rental_description, rental')
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
  
  private
  
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
        ).order('created_at DESC').limit(1).last
      
        if not result
          # @idle << list_item
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
