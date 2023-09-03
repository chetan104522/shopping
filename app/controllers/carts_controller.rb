class CartsController < ApplicationController


	def index
		@carts = Cart.all
	end

	def create
		cart = Cart.new
		cart.user_id = current_user.id
		cart.save
		redirect_to carts_path
	end


	def destroy
		Cart.find(params[:id]).delete
	end

end
