class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all.order(created_at: :desc)
	end

	def show
		@recipe  = Recipe.find(params[:id])

	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])

    	if @recipe.update(recipe_params)
    		redirect_to recipe_path
	    else
	      render :edit
	    end
	end
	
	def destroy
		@recipe = Recipe.find(params[:id])
	    
	    @recipe.destroy
	    
	    redirect_to recipes_path
	end

	private

	def recipe_params
		params.require(:recipe).permit(
			:name, :description, :serving_size, :difficulty_rating, :equipment, :ingredient, :direction)
	end
end
