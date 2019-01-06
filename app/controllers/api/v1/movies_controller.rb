module Api
  module V1
    class MoviesController < BaseController
      before_action :set_movie, only: [:show, :update, :destroy]

      def index
        movie = Movie.all
        render(
          json: ActiveModel::ArraySerializer.new(
            movie,
            each_serializer: Api::V1::MovieSerializer,
            root: 'movie'
          )
        )
      end

      def show
        render json: @movie,
          serializer: Api::V1::MovieSerializer, status: 201
      end

      def create
        movie = Movie.create(movie_params)
        if movie.save
          render json: movie, status: :created
        else
          render json: movie.errors, status: :unprocessable_entity
        end
      end

      def update
        if @movie.update(movie_params)
          render json: @movie, status: 200
        else
          render json: { errors: @movie.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @movie.destroy
        render json: {message: "Movie was deleted"}, status: 200
      end

      private
      def movie_params
        params.permit(:title, :release_year)
      end

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end
