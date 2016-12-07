class Ticket::EmployeeEntryDecorator < Ticket::TimesheetEntryDecorator
  def duration_standard
    num = (object.payroll_duration_standard.to_f / 60).round(2)
    if num > 0
      "#{num} hours"
    end
  end
  
  def duration_overtime
    num = (object.payroll_duration_overtime.to_f / 60).round(2)
    if num > 0
      "#{num} hours"
    end
  end
  
  def edit_summary
    if object.reason_for_edit
      "#{object.reason_for_edit} — originally entered at #{object.created_at}"
    else
      "Entered at #{object.created_at}"
    end
  end
end
