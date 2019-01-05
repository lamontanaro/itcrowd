module Api
  module V1
    class PeopleController < BaseController
      before_action :set_person, only: [:show, :update, :destroy]

      def index
        render json: Person.all, status: 201
      end

      def show
        render json: @person, status: 201
      end

      def create
        person = Person.create(person_params)
        if person.save
          render json: person, status: :created
        else
          render json: person.errors, status: :unprocessable_entity
        end
      end

      def update
        if @person.update(person_params)
          render json: @person, status: 200
        else
          render json: { errors: @person.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @person.destroy
        render json: {message: "Person was deleted"}, status: 200
      end

      private
      def person_params
        params.permit(:last_name, :first_name, :aliases)
      end

      def set_person
        @person = Person.find(params[:id])
      end
    end
  end
end
