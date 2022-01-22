class BookmarksController < ApplicationController
  def new
    # we need @list in our `simple_form_for`
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end
  # def delete
  #   @list = List.find(params[:list_id])
  # end

  private

  def bookmark_params
    # params.require(:bookmark).permit(:comment)
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
