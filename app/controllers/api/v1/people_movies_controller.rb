module Api
  module V1
    class PeopleMoviesController < BaseController
      include PeopleMoviesDoc
      before_action :authenticate_api_v1_user!, only: [:create, :update, :destroy]
      before_action :set_people_movie, only: [:show, :update, :destroy]

      def index
        render json: PeopleMovie.all, status: 201
      end

      def show
        render json: @people_movies, status: 201
      end

      def create
        people_movies = PeopleMovie.create(people_movies_params)
        if people_movies.save
          render json: people_movies, status: :created
        else
          render json: people_movies.errors, status: :unprocessable_entity
        end
      end

      def update
        if @people_movies.update(people_movies_params)
          render json: @people_movies, status: 200
        else
          render json: { errors: @people_movies.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @people_movies.destroy
        render json: {message: "PeopleMovie was deleted"}, status: 200
      end

      private
      def people_movies_params
        params.permit(:person_id, :movie_id, :role,)
      end

      def set_people_movie
        @people_movies = PeopleMovie.find(params[:id])
      end
    end
  end
end
