module Api
  module V1
    class CountriesController < Api::V1::ApiController
      before_action :set_country, only: %i[show update destroy]
      before_action do
        permission?(Country)
      end

      def create
        country = Country.new(country_params)
        if country.save
          render json: country, status: :created
        else
          render json: error_message(country)
        end
      end

      def index
        countries = Country.all
        render json: countries
      end

      def show
        render json: @country
      end

      def update
        if @country.update(country_params)
          render json: @country
        else
          render json: error_messages(@country)
        end
      end

      def destroy
        @country.destroy
      end

      private

      def set_country
        @country = Country.find(params[:id])
      end

      def country_params
        params.require(:country).permit(:id, :name)
      end
    end
  end
end
