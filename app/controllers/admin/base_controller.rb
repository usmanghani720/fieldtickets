class Admin::BaseController < ApplicationController
  
  private
  
    def authorized?
      current_user.manager?
    end
end
