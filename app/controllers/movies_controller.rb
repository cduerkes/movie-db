class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:created_at).page(params[:page])
  end

  def new
    @movie = Movie.new
  end
end
