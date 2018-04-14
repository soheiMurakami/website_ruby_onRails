class ViewersController < ApplicationController
   before_action :authorize, except: [:new, :create, :destroy]
   
    def new
        if session[:viewer_hash]
           @viewer = Viewer.create_from_hash(session[:viewer_hash].symbolize_keys)
           @viewer.valid?
        else
             @viewer = Viewer.new
        end
    end
    
    def create
        if session[:viewer_hash]
            @viewer = Viewer.create_from_hash(session[:viewer_hash].symbolize_keys)
            @viewer.name = viewer_params[:name]
            @viewer.email = viewer_params[:email]
        else
            @viewer = Viewer.new(viewer_params)
        end
        if @viewer.save
            session[:user_hash] = nil
            login(@viewer)
            UserMailer.signupconfirmation(@viewer).deliver
            redirect_to root_path, notice: "Successfully signed up!"
        else
            render :new
        end
    end
    
    def edit 
        @viewer = current_viewer
    end
    
    def show 
        @viewer = Viewer.find(params[:id])
    end
    
    
    def destroy
        @viewer = Viewer.find(params[:id])
        if @viewer.present?
           @viewer.destroy
        end
        redirect_to root_path, notice: "viewer has deleted"
    end
    
    def update
        @viewer = current_viewer
        if @viewer.update_with_password(viewer_params)
            redirect_to ratings_path, notice: "Account updated"
        else
       
            render :edit
        end
    end
    
    private 
    
    def viewer_params
        params.require(:viewer).permit(:name,:email,:password,:password_confirmation,:current_password)
    end
    
    def load_viewer
        @viewer = Viewer.find params[:id]
    end
end
