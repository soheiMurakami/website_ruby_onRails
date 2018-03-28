class SessionsController < ApplicationController
    def new
    end
    
    def create 
        @viewer = Viewer.where(email: params[:email]).first
        if @viewer && @viewer.authenticate(params[:password])
            login(@viewer)
            location = session[:protected_page] ? session[:protected_page] : root_path
            session[:protedted_page] = nil
            redirect_to location, notice: "You are logged in."
        else
            redirect_to login_path, alert:"Invalid Email/password"
        end
    end
    def destroy
        logout
        redirect_to root_path, notice: "You are logged out"
    end
end
