class ReviewsController < ApplicationController

  before_action :set_movie

  def index 
    @reviews = @movie.reviews
  end 

  def new 
    @review = @movie.reviews.new
  end 

  def create 
    @review = @movie.reviews.new(review_params)
    if @review.valid?
      @review.save 
      redirect_to @movie, notice: "Review successfully saved!"
    else
      render :new
    end
  end 

  def edit 
    @review = @movie.reviews.find(params[:id])
  end 

  def update 
     @review = @movie.reviews.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @movie, notice: "Review successfully saved!"
    else
      render :new
    end
  end 

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to movie_path(@movie), alert: "Review has been deleted"
  end 

  private 
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end 

  def review_params 
    params.require(:review).permit(:name, :stars, :comment)
  end 
end
