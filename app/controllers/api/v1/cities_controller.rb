module Api
  module V1
    class CitiesController < Api::V1::ApiController
      before_action :set_city, only: %i[show update destroy]
      before_action do
        permission?(City)
      end

      def create
        city = City.new(department_params)
        if city.save
          render json: city, status: :created
        else
          render json: error_message(city)
        end
      end

      def index
        cities = City.all
        render json: cities
      end

      def show
        render json: @city
      end

      def update
        if @city.update(department_params)
          render json: @city
        else
          render json: error_messages(@city)
        end
      end

      def destroy
        @city.destroy
      end

      private

      def set_department
        @city = City.find(params[:id])
      end

      def department_params
        params.require(:city).permit(:id, :department_id, :name)
      end
    end
  end
end
