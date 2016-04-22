require 'rails-jquery-autocomplete'

class ApplicationController < ActionController::Base
  include RenamedRoutesHelper
  include DateHelper
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
