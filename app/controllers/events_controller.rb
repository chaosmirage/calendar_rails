class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [
    :index, :create, :show, :edit, :update, :destroy
  ]

  layout "dashboard"

  def index
    @events = @user.events.all
  end

  def new
    @event = Event.new
  end

  def edit; end

  def show; end

  def create
    @user.events << Event.create(event_params)

    if @user.events.last.errors.empty?
      redirect_to event_path(@user.events.last)
    else
      render "new"
    end
  end

  def update
    @event.update_attributes(event_params)
    if @event.errors.empty?
      redirect_to event_path(@event)
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy

    redirect_to action: "index"
  end

  private

  def event_params
    params.require(:event).permit!
  end

  def find_event
    @user = find_user
    @event = @user.events.find(params[:id])

    render_404 unless @event
  end

  def find_user
    @user = current_user
  end
end
