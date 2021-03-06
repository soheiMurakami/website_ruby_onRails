class RatingsController < ApplicationController
    before_action :authorize
    before_action :load_rating, except: [:index, :new, :create]
    #GET /rating ratings#index
    def index 
        @ratings = current_viewer.ratings.all
    end

    def new 
        @rating = Rating.new
    end

    def create
        @rating = Rating.new rating_params
        @rating.viewer = current_viewer

        if @rating.save
            redirect_to @rating, notice: "Rating has done" 
        else
            render :new 
        end
    end
    #GET /ratings/:id ratings#show
    def show 
        @rating = Rating.find(params[:id])
    end
    #GET /ratings/:id/edit ratings#edit
    def edit
    end
    #PATCH/PUT /ratings/:id ratings#update
    def update 
        
        if @rating.update_attributes rating_params
            redirect_to @rating, notice: "Rating Updated" 
        else
            render :edit
        end
    end
    #DELETE /ratings/:id ratings#destroy
    def destroy
        @rating.destroy
            redirect_to ratings_path, notice: "Rating has deleted" 
        
    end
    
    
    
    private
    
    def load_rating
        @rating = current_viewer.ratings.find params[:id]
    end
    
    def rating_params
        params.require(:rating).permit(:title, :rating, :description)
    end
    
   
    
end
