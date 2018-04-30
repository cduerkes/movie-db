class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params.merge(user: current_user))
    if @review.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params.merge(user: current_user))
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.update_attributes(review_params.merge(user: current_user))
    if @review.valid?
      redirect_to review_path(@review)
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
