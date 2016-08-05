class EventsController < ApplicationController
	def index
		@events = Event.all
		# @events = Event.page(params[:page]).per(5)

		respond_to do |format|
			format.html # index.html.erb
			format.xml { render :xml => @events.to_xml }
			format.json { render :json => @events.to_json }
			format.atom { @feed_title = "My event list" } # index.atom.builder
		end
	end

	def new
		@event = Event.new		
	end

	def create
		#@event = Event.new(params[:event])
		@event = Event.new(event_params)
		@event.save
		redirect_to :action => :index
	end

	def show
		# @event = Event.find(params[:id])
		@event = Event.find(params[:id])
		respond_to do |format|
			format.html { @page_title = @event.name } # show.html.erb
			format.xml # show.xml.builder
			format.json { render :json => { id: @event.id, name: @event.name }.to_json }
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		#redirect_to :action => :show, :id => @event
		redirect_to event_url(@event)
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		#redirect_to :action => :index
		redirect_to event_url(@event)
	end

	#private
	def event_params
		params.require(:event).permit(:name, :description)
	end

	private :event_params
end
