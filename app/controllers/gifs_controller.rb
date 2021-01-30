class GifsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :random]
  before_action :set_gif, only: [:show, :edit, :update, :destroy]

  def index
    @gifs = Gif.includes(:tags, :user, image_attachment: :blob).sorted
  end

  def new
    @gif = Gif.new
  end

  def show
  end

  def edit
  end

  def update
    @gif.update(gif_params)

    redirect_to root_path
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.user = current_user
    if @gif.save
      redirect_to root_path
    else
      render new
    end
  end

  def random
    @gif = Gif.tagged_with(params[:tag]).random
    @gif ||= Gif.random
    render :show
  end

  def destroy
    @gif.destroy

    redirect_to root_path
  end

  private

  def gif_params
    permitted = [:tag_list]
    permitted += [:image] if action_name == "create"
    params.require(:gif).permit(*permitted)
  end

  def set_gif
    @gif = Gif.find(params[:id])
  end
end
