class FavoritesController < ApplicationController
  def create
    @movie_id = params[:movie_id]
    @fav = Favorite.create!(movie_id: @movie_id, faved: true)
    redirect_to movie_path(@movie_id)
  end

  def destroy
    @fav = Favorite.find_by!(params[:id])
    @movie_id = @fav.movie_id
    @fav.destroy
    redirect_to movie_path(@movie_id)
  end
end
