module Api
  module V1
    class PeopleController < BaseController
      include PeopleDoc
      before_action :authenticate_api_v1_user!, only: [:create, :update, :destroy]
      before_action :set_person, only: [:show, :update, :destroy]

      def index
        people = Person.all
        render(
          json: ActiveModel::ArraySerializer.new(
            people,
            each_serializer: Api::V1::PeopleSerializer,
            root: 'people'
          )
        )
      end

      def show
        render json: @person,
          serializer: Api::V1::PeopleSerializer, status: 200
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
