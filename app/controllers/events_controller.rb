class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [
    :index, :create, :show, :edit, :update, :destroy
  ]
  before_action :type_repeat, only: [:new, :edit]

  layout "dashboard"

  def index
    @events = @user.events.order("date DESC").all
  end

  def new
    @event = Event.new
  end

  def edit; end

  def show; end

  def create
    @user.events << Event.create(event_params)

    if @user.events.last.errors.empty?
      redirect_to events_path
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
    render json: {success: true}
  end

  private

  def type_repeat
    @type_repeat = {
      daily: "daily",
      weekly: "weekly",
      monthly: "monthly",
      yearly: "yearly"
    }
  end

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
