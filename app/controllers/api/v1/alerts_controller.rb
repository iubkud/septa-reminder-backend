module Api
  module V1
    class AlertsController < ApplicationController
      before_action :set_alert, only: [:show, :update, :destroy]
      before_action :authenticate_user

      # GET /alerts
      def index
        @alerts = Alert.all

        render json: @alerts
      end

      # GET /alerts/1
      def show
        render json: @alert
      end

      # POST /alerts
      def create
        @alert = @current_user.alerts.new(alert_params)

        if @alert.save
          render json: @alert, status: :created, location: api_v1_alert_url(@alert)
        else
          render json: @alert.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /alerts/1
      def update
        if @alert.update(alert_params)
          render json: @alert
        else
          render json: @alert.errors, status: :unprocessable_entity
        end
      end

      # DELETE /alerts/1
      def destroy
        @alert.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_alert
          @alert = Alert.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def alert_params
          params.require(:alert).permit(:alert_time, :train_id, :nickname)
        end
    end
  end
end
