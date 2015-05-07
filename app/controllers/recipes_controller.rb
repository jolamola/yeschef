class RecipesController < ApplicationController
	
	# shows all recipes of current user
	def index
		if current_user
			@recipes = current_user.recipes.all.order(created_at: :desc)
			@recipe = Recipe.new
		end
	end

	# show method for specified recipe
	def show
		@recipe  = Recipe.find(params[:id])
	end

	# new method for new recipe
	def new
		@recipe = Recipe.new
	end

	# creates new recipe then redirects to recipe to add components
	def create
		@recipe = Recipe.new(recipe_params)

		@user = User.find(session[:user_id])
		@recipe.user_id = @user.id
		@recipe.save
		# if @recipe.valid?
		# 	@recipe.save
		# 	redirect_to recipe_path(@recipe)

		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			redirect_to recipes_path
		end		
	end

	# edit method for recipe
	def edit
		@recipe = Recipe.find(params[:id])
	end

	# update method for recipe
	def update
		@recipe = Recipe.find(params[:id])

    	if @recipe.update(recipe_params)
    		redirect_to recipe_path
	    end		
	end

	# destroy method for recipe
	def destroy
		@recipe = Recipe.find(params[:id])
	    @recipe.destroy
	    redirect_to recipes_path
	end

	private

	# required params to create recipe
	def recipe_params
		params.require(:recipe).permit(
			:rName, :serving_size, :ingredient, :instruction, :photo)
	end	

end
