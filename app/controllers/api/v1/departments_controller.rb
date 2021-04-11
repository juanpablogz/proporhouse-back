module Api
  module V1
    class DepartmentsController < Api::V1::ApiController
      before_action :set_department, only: %i[show update destroy]
      before_action do
        permission?(Department)
      end

      def create
        department = Department.new(department_params)
        if department.save
          render json: department, status: :created
        else
          render json: error_message(department)
        end
      end

      def index
        departments = Department.all
        render json: departments
      end

      def show
        render json: @department
      end

      def update
        if @department.update(department_params)
          render json: @department
        else
          render json: error_messages(@department)
        end
      end

      def destroy
        @department.destroy
      end

      private

      def set_department
        @department = Department.find(params[:id])
      end

      def department_params
        params.require(:department).permit(:id, :country_id, :name)
      end
    end
  end
end
