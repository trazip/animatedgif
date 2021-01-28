class GifsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_gif, only: :show

  def index
    @gifs = Gif.all
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

  private

  def gif_params
    params.require(:gif).permit(:image, :tag_list)
  end

  def set_gif
    @gif = Gif.find(params[:id])
  end
end
