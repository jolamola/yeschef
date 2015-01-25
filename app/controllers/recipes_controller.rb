class RecipesController < ApplicationController
	def index
		if current_user
			@recipes = current_user.recipes.all.order(created_at: :desc)
		end
	end

	def show
		@recipe  = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		@user = User.find(session[:user_id])
		@recipe.user_id = @user.id
		@recipe.save

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
			:rName, :description, :serving_size, :equipment, :photo, component_attributes: 
			[:cName, :direction, :ingredient])
	end	

end
