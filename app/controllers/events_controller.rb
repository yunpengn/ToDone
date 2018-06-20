class EventsController < ApplicationController
	http_basic_authenticate_with name: 'user', password: '123', except: [:show]

	def index
		@events = Event.all
	end

	def show
		@categories = Category.all
		@category = Category.find(params[:category_id])
		@event = @category.events.find(params[:id])
	end

	def new
		@categories = Category.all
		@category = Category.find(params[:category_id])
		@event = @category.events.build
	end

	def edit
		@categories = Category.all
		@category = Category.find(params[:category_id])
		@event = @category.events.find(params[:id])
	end

	def create
		@category = Category.find(params[:category_id])
		@event = @category.events.create(event_params)

		if @event.save
			redirect_to category_path(@category)
		else
			render 'new'
		end
	end

	def update
		@category = Category.find(params[:category_id])
		@event = @category.events.find(params[:id])

		if @event.update(event_params)
			redirect_to category_path(@category)
		else
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@event = @category.events.find(params[:id])
		@event.destroy

		redirect_to category_path(@category)
	end

	private
	def event_params
		params.require(:event).permit(:title, :time, :place, :details)
	end
end
