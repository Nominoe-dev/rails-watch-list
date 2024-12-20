class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new # Needed to instantiate the form_with
    @list = List.find(params[:list_id])
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)

    @list = List.find(params[:list_id])

    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @movies = Movie.all
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
