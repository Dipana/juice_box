class JuicerecipesController < ApplicationController
	before_action :find_juicerecipe, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@juicerecipe = Juicerecipe.all.order("created_at DESC")
	end

	def show
	end

	def new
		@juicerecipe = current_user.juicerecipes.build
	end

	def create
		@juicerecipe = current_user.juicerecipes.build(juicerecipe_params)

		@juicerecipe.save1
 		@current_juicerecipe  = @pjuicerecipe
		@juicerecipes = Juicerecipe.all
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
		params.require(:juicerecipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
	end

	def find_juicerecipe
		@juicerecipe = Juicerecipe.find(params[:id])
	end
end
