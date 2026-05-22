class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create ]
  before_action :set_bookmark, only: [ :destroy ]

  def new
    movie_id = params[:movie_id] || params.dig(:bookmark, :movie_id)
    @movie = Movie.find(movie_id) if movie_id.present?
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    @movie = @bookmark.movie

    if @bookmark.save
      redirect_to list_path(@list), notice: "Movie was successfully added to the list."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
