class EpisodesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json: Episode.all
    end
    # shows all episodes

    def show
        render json: find_episode
    end
    # how you find just one episode

    def destroy
        episode = find_episode
        episode.destroy
        head :no_content 
    end
    # head :no_content is the status code

    private 

    def find_episode
        Episode.find(params[:id])
    end

def render_not_found_response
            render json: {errors: "Episode not found"}, status: :not_found
        end
end
