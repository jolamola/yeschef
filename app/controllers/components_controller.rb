class ComponentsController < ApplicationController

	before_action :get_recipe

	def new 
		@component = Component.new
		@components = @recipe.components
	end

	# create method for new recipe component
	def create
		@component = @recipe.components.new(component_params)
		
		if @component.save
			redirect_to recipe_path(@recipe.id)
		else
			render :new
		end
	end

	# edit for recipe component
	def edit
		@component = @recipe.components.find(params[:id])
	end

	#update for recipe component
	def update
		@component = @recipe.components.find(params[:id])

    	if @component.update(component_params)
    		flash[:info] = "#{@component.cName} was updated!"
    		redirect_to recipe_path(@recipe.id)
	    else
	    	flash[:danger] = "No changes were made to #{@component.cName}"
	      	redirect_to recipe_path(@recipe.id)
	    end		
	end

	# delete/destroy recipe component
	def destroy
		@component = @recipe.components.find(params[:id])
		@component.destroy
		flash[:info] = "#{@component.cName} was deleted!"
		redirect_to recipe_path(@recipe.id)
	end

	private

	# params for recipe component
	def component_params
		params.require(:component).permit(:cName, :direction, :ingredient)
	end	

	# method used for before_action
	def get_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end

end
