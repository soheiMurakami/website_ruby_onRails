class ViewersController < ApplicationController
   before_action :authorize, except: [:new, :create, :destroy]
   
    def new
        @viewer = Viewer.new
    end
    
    def create
        @viewer = Viewer.new(viewer_params)
        if @viewer.save
            login(@viewer)
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
