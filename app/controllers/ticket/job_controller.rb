class Ticket::JobController < Ticket::BaseController
  before_action :set_ticket, except: :autocomplete_employee_display_name
  
  autocomplete :employee, :display_name, limit: 50, full: true, scopes: [:crew_chief]
  
  def index_crew_chief
  end
end
