class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:created_at).page(params[:page])
  end

  def new
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params)
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary)
  end
end
