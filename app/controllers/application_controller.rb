require 'rails-jquery-autocomplete'

class ApplicationController < ActionController::Base
  include Pundit
  
  before_action :authenticate_employee!
  before_action :set_author
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def set_author
    if current_employee
      Concern::Audit::Author.current = current_employee.id
    end
  end
  
  def current_user
    current_employee
  end
  
  # Render the previous display without redirecting it
  def render_previous
    hsh = Rails.application.routes.recognize_path(request.referer)
    render template: "#{hsh[:controller]}/#{hsh[:action]}"
  end
end
