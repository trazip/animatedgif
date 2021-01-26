class GifsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    @gif.save

    redirect_to root_path
  end

  private

  def gif_params
    params.require(:gif).permit(:image)
  end
end
