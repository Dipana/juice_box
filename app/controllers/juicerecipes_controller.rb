class JuicerecipesController < ApplicationController
	before_action :find_juicerecipe, only: [:show, :edit, :update, :destroy]

	def index
		@juicerecipe = Juicerecipe.all.order("created_at DESC")
	end

	def show
	end

	def new
		@juicerecipe = Juicerecipe.new
	end

	def create
		@juicerecipe = Juicerecipe.new(juicerecipe_params)

		if @juicerecipe.save
			redirect_to @juicerecipe, notice: "Successfully created new juicerecipe"
		else
			render 'new'
		end
	end

	def edit

		
	end

	def update
		if @juicerecipe.update(juicerecipe_params)
			redirect_to @juicerecipe
		else
			render 'edit'
		end
	end

	def destroy
		@juicerecipe.destroy
		redirect_to root_path, notice: "Successfully deleted juicerecipe"
	end

	private

	def juicerecipe_params
		params.require(:juicerecipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], direction_attributes: [:id, :step, :_destroy])
	end

	def find_juicerecipe
		@juicerecipe = Juicerecipe.find(params[:id])
	end
end
