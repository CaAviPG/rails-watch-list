class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
    # no need for app/views/restaurants/create.html.erb
    # redirect_to restaurant_path(@restaurant)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
