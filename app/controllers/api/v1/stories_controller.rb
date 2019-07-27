# frozen_string_literal: true

class Api::V1::StoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @stories = Story.order(created_at: :desc)
    # render json: @stories
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(permit_story)
    if @story.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    puts 'yeah'
  end

  def destroy
    puts 'Oh OK'
  end

  private

  def render_error
    render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
  end

  def permit_story
    params.require(:story).permit(:name, :text)
  end
end
