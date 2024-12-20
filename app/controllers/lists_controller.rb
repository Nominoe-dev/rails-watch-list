class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movie = Movie.new
  end

  def new
    @list = List.new # Needed to instantiate the form_with
  end

  def create
    @list = List.new(list_params)
    @list.save
    # No need for app/views/lists/create.html.erb
    redirect_to lists_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
