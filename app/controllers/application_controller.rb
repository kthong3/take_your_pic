class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  def not_found
      raise ActionController::RoutingError.new('Not Found')
    rescue
      render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end