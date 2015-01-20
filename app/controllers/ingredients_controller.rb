# class IngredientsController < ApplicationController
# 	def create
# 		@ingredient = Ingredient.new(params.require(:ingredient).permit(:name, :quantity, :unit))
# 		# @recipe.recipe_id = params[:recipe_id]
# 		@recipe.ingredients.save
# 			redirect_to recipe_path(@ingredient.recipe)
# 	end

# end