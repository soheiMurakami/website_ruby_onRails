class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def render_404
    render file: 'public/404', status: :not_found, :formats => [:html]
  end
  
  private 
  
  def authorize
    unless current_viewer
      session[:protected_page] = request.fullpath
      redirect_to login_path, alert: "you must log in that page"
    end
  end
  
  def login(viewer)
    session[:viewer_id] = viewer.id
  end
  
  def logout()
    session[:viewer_id] = nil
  end
  
  def current_viewer
    @current_viewer ||= Viewer.find(session[:viewer_id]) if session[:viewer_id]
    rescue ActiveRecord::RecordNotFound
  end
  
  helper_method :current_viewer
  
    
end
