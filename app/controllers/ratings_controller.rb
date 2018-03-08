class RatingsController < ApplicationController
    before_action :load_rating, except: [:index, :new, :create]
    
    def index 
        @ratings = Rating.all
    end
    
    def new 
        @rating = Rating.new
    end
    
    def create
        @rating = Rating.new rating_params
        if @rating.save
            redirect_to @rating, notice: "Rating has done"
        else
            render :new
        end
        
    end
    
    def show 
    end
    
    def edit
    end
    
    def update 
        if @rating.update_attributes rating_params
            redirect_to @rating, notice: "Rating Updated"
        else
            render :edit
        end
    end
    
    def destroy
        @rating.destroy
        redirect_to ratings_path, notice: "Rating has deleted"
    end
    
    private
    
    def load_rating
        @rating = Rating.find params[:id]
    end
    
    def rating_params
        params.require(:rating).permit(:title, :rating, :description)
    end
    
end
