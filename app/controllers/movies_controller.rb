class MoviesController < ApplicationController

    before_action :set_movie, only: [:show, :edit, :update, :destroy ]

    def index
        @movies = Movie.released
    end

    def show
        @review = @movie.reviews.new
    end

    def edit 
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            flash[:notice] = "Movie successfully updated"
            redirect_to @movie
        else 
            render :edit 
        end 
    end 

    def new
        @movie = Movie.new
    end

    def create 
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie, notice: "Movie has been created"
        else
            render :new 
        end
    end

    def destroy 
        @movie.destroy
        redirect_to movies_path, alert: "Movie has been deleted"
    end 

    private
    def set_movie
        @movie = Movie.find(params[:id])
    end 

    def movie_params
        params.require(:movie).permit(:title, :description, :rating, :director, :duration,                                              :image_file_name, :total_gross, :released_on) 
    end
end
