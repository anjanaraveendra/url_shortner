class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :set_base

  def set_base
  	@base_url = request.protocol.to_s + request.host_with_port.to_s + "/"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end 
end
