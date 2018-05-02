class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params.merge(user: current_user))

    if @review.valid? && @movie.movie_reviewed_by_current_user(current_user.id)
      redirect_to root_path
    else
      redirect_to movie_path(@movie), status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params.merge(user: current_user))
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.update_attributes(review_params.merge(user: current_user))

    if @review.valid? & movie_reviewed_by_current_user(current_user.id)
      redirect_to movie_path(@movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @movie.reviews.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
