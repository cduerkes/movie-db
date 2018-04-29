class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @movies = Movie.order(:created_at).page(params[:page])
  end

  def new
    @movie = Movie.new
  end

  def create
    current_user.movies.create(movie_params)
    redirect_to root_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    redirect_to root_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary)
  end
end
