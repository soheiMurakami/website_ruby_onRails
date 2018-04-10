class CharactersController < ApplicationController
    before_action :load_rating
    before_action :load_character, except: [:index, :new, :create]
    
    def index 
        @characters = @rating.characters.all
    end
    
    
    def new 
        @character = Character.new
    end
    
    def create
        @character = Character.new character_params
        
        if @rating.characters << @character
               # redirect_to @character, notice: "character info has done"
            redirect_to rating_characters_path, notice: "character info created" 
        else
            render :new 
        end
    end
    
    def show 
    end
    
    def edit
    end
    
    def update
        
        if @character.update_attributes character_params
            redirect_to [@rating,@character], notice: "Character info Updated" 
        else
            render :edit 
        
        end 
    end
    
    def destroy
        @character.destroy
        redirect_to rating_characters_path(@rating), notice: "Character info has deleted"
    end
    
    private
    
    def load_rating
        @rating = Rating.find params[:rating_id]
    end
    
    def load_character
        @character = @rating.characters.find params[:id]
    end
    
    def character_params
        params.require(:character).permit(:name, :role)
    end
    
end
