module Api
  module V1
    class NeighborhoodsController < Api::V1::ApiController
      before_action :set_department, only: %i[show update destroy]
      before_action do
        permission?(Neighborhood)
      end

      def create
        neighborhood = Neighborhood.new(department_params)
        if neighborhood.save
          render json: neighborhood, status: :created
        else
          render json: error_message(neighborhood)
        end
      end

      def index
        neighborhoods = Neighborhood.all
        render json: neighborhoods
      end

      def show
        render json: @neighborhood
      end

      def update
        if @neighborhood.update(department_params)
          render json: @neighborhood
        else
          render json: error_messages(@neighborhood)
        end
      end

      def destroy
        @neighborhood.destroy
      end

      private

      def set_department
        @neighborhood = Neighborhood.find(params[:id])
      end

      def department_params
        params.require(:neighborhood).permit(:id, :city_id, :name)
      end
    end
  end
end
