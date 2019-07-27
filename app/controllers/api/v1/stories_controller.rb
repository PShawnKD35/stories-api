# frozen_string_literal: true

class Api::V1::StoriesController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :find_story, only: [:show, :update]

  def index
    @stories = Story.order(created_at: :desc)
    # render json: @stories
  end

  def show
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
    if @story.update(permit_story)
      render :show
    else
      render_error
    end
  end

  def destroy
    render json: { message: "Nice Try!" }
    # head :no_content
    # # if @story.destroy
    # #   render :index
    # # else
    # #   render_error
    # # end
  end

  private

  def find_story
    @story = Story.find(params[:id])
  end

  def render_error
    render json: { errors: @story.errors.full_messages }, status: :unprocessable_entity
  end

  def permit_story
    params.require(:story).permit(:name, :text)
  end
end
