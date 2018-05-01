class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @movies = Movie.search(params[:search])
    if @movies.class == Array
      @movies = Kaminari.paginate_array(@movies).page(params[:page])
    else
      @movies = @movies.order(:created_at).page(params[:page]) # if @movies is AR::Relation object 
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.create(movie_params)
    if @movie.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @reviews = @movie.find_reviews
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    if @movie.valid?
      redirect_to movie_path(@movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :poster)
  end

  def require_admin
    unless current_user && current_user.admin = true
      redirect_to root_path, notice: "User must be admin."
    end
  end
end
