class ComponentsController < ApplicationController

	before_action :get_recipe

	def new 
		@component = Component.new
		@components = @recipe.components
	end

	def create
		@component = @recipe.components.new(component_params)
		
		if @component.save
			redirect_to recipe_path(@recipe.id)
		else
			render :new
		end
	end

	def show
	end

	def edit
		@component = @recipe.components.find(params[:id])
	end


	def update
		@component = @recipe.components.find(params[:id])

    	if @recipe.components.update(component_params)
    		flash[:info] = "#{@component.cName} was updated!"
    		redirect_to recipe_path(@recipe.id)
	    else
	    	flash[:danger] = "No changes were made to #{@component.cName}"
	      redirect_to recipe_path(@recipe.id)
	    end		
	end


	def destroy
		@component = @recipe.components.find(params[:id])
		@component.destroy
		flash[:info] = "#{@component.cName} was deleted!"
		redirect_to recipe_path(@recipe.id)
	end



	private

	def component_params
		params.require(:component).permit(:cName, :direction, :ingredient)
	end	

	def get_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end

end
