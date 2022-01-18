class AppearancesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
# stuff above is error handling^
    
    def create 
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    end

    private

    def appearance_params
        params.permit(:episode_id, :guest_id, :rating)
    end

# error handling stuff 

    def render_unprocessable_entity_response
        render json: {errors: ["Validation errors"]}, status: :unprocessable_entity
    end
end
