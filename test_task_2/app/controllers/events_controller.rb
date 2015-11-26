class EventsController < ApplicationController
  public

  # фильтры
  #=================================================================
  before_filter :find_event, only: [:show, :edit, :update, :destroy]


  # формы
  #=================================================================
  # вывод всех событий
  def index
    @events = Event.all
  end

  # форма создания события -> create
  def new
    @event = Event.new
  end

  # форма редактирования события -> update
  def edit; end

  # экшены restful контроллера CRUD
  #=================================================================
  def show; end

  def create
    @event = Event.create(event_params)

    if @event.errors.empty?
      redirect_to event_path(@event)
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
    # TODO: проверить, работает ли, если да, удалить старый вариант
    # params.require(:event).permit(:title, :date, :type_repeat)
    params.require(:event).permit!
  end

  def find_event
    @event = Event.find(params[:id])
    render_404 unless @event
  end
end
