class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def render_404
  render file: 'public/404', status: :not_found, :formats => [:html]
  end
end
