class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

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

  def require_admin
    @movie = Movie.find(params[:id])
    if current_user.admin != true
      redirect_to movie_path(@movie), notice: "User must be admin."
    end
  end
end
