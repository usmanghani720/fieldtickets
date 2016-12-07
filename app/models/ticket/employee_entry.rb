class Ticket::EmployeeEntry < ActiveRecord::Base
  include CreatedBy
  include TimesheetEntry
  
  belongs_to :employee
  validates :employee, presence: true
  belongs_to :payroll_period
  has_one :ticket, through: :employee
  
  before_create :cannot_be_already_submitted_to_payroll
  before_update :cannot_be_already_submitted_to_payroll
  
  enum status: { idle: 0, transport: 1, maintenance: 2, on_the_job: 3 }
  
  # PAYROLL STUFF HERE
  # This isn't very DRY... sorry...
  # enum payroll_bill_to: {
  #   job: 0,
  #   job_correction: 1,
  #   cancelled_job: 2,
  #   # non-job items below
  #   weather: 3,
  #   overhead: 4,
  #   office_staff: 5,
  #   transport: 6,
  #   shop: 7
  # }, _prefix: true
  # THE ABOVE CODE DIDN'T WORK
  enum payroll_pay_rate: { day_pay: 1, night_pay: 2 }
  enum payroll_status: { bill_to_job: 1, overhead: 2 }
    
  acts_as_paranoid
  
  def to_s
    employee.to_s
  end
  
  def decoded_payroll
    @decode_payroll_category_string ||= Ticket::EmployeeEntry.where(payroll_category_string: payroll_category_string).first
  end
  
  private

    def cannot_be_already_submitted_to_payroll
      date = ticket.first_employee_entry
      date ||= time.to_date
      if false
      #if payroll_period
      #if PayrollPeriod.exists_for_date(date)
        self.errors.add(:time, :already_submitted_to_payroll)
        return false
      end
    end
  
end