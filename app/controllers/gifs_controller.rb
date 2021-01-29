class GifsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :random]
  before_action :set_gif, only: [:show, :destroy]

  def index
    @gifs = Gif.sorted
  end

  def new
    @gif = Gif.new
  end

  def show
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.user = current_user
    @gif.save

    redirect_to root_path
  end

  def random
    @gif = Gif.tagged_with(params[:tag]).order('RANDOM()').first
    render :show
  end

  def destroy
    @gif.destroy

    redirect_to root_path
  end

  private

  def gif_params
    params.require(:gif).permit(:image, :tag_list)
  end

  def set_gif
    @gif = Gif.find(params[:id])
  end
end
