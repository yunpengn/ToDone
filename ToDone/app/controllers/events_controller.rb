class EventsController < ApplicationController
	def index
		@all_events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def  new
		# There is no need to declare a new instance variable in the method "new", because the data should be retrieved from the "create" method
		# since render does not issue a new request to the browser. Meanwhile, since we have already defined "data" in the "create", we actually 
		# do not need to create any more variables.
		
		#@event = Event.new
	end

	def create
		@data = Event.new(event_params)
		if @data.save
			redirect_to @data
		else
			render 'new'
		end
	end

	private
	def event_params
		params.require(:event).permit(:title, :time, :place)
	end
end
