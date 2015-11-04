class TodosController < ApplicationController

	def index
		@todos = session[:todos]
		unless @todos
			@todos = []
		end
	end

	def new
	end

	def create
		title = params[:title]
		todo = {
			     id: Time.now.to_i,
				 title: title
			   }

		if session[:todos]
		  session[:todos] << todo
		else
		  session[:todos] = [todo]
		end

		redirect_to "/todos"
	end

end