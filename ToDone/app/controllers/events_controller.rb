class EventsController < ApplicationController
	def index
		@all_events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def  new
		@event = Event.new
	end

	def edit
		@event = Event.find(params[:id])
	end

	def create
		# There is a naming convention when using Ruby on Rails to build a Web Application
		# You had better name the below instance variable as "event", in its singular form
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to events_path
	end

	private
	def event_params
		params.require(:event).permit(:title, :time, :place)
	end
end
