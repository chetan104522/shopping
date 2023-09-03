class OrdersController < ApplicationController

	def create
		order = Order.new
		order.user_id = current_user.id
		order.save
		flash[:notice] = "Your order is place"
	end
end
