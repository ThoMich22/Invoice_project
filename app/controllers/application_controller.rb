class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource_or_scope)
    invoices_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    invoices_path
  end
  
end
