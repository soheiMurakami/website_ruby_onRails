class SoheisController < ApplicationController
    before_action :authorize
    before_action :load_sohei, except: [:index, :new, :create]
    
    def index
       @soheis = current_viewer.soheis.all 
    end
    
    def new
       @sohei = Sohei.new 
    end
    
    def create
        @sohei = Sohei.new(sohei_params)
        @sohei.viewer = current_viewer
        if @sohei.save
            redirect_to @sohei, notice: "Successfully created sohei." 
        else
            render :new
        end
    end
    
    def show
    end
    
    def destroy
       @sohei.destroy
       redirect_to soheis_path, notice: "Successfully deleted sohei."
    end
    
    private
    
    def load_sohei
      @sohei = current_viewer.soheis.find params[:id]  
    end
    
    def sohei_params
       params.require(:sohei).permit(:name,:priority) 
    end
end
