class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_user

  def show
    @gifs = @user.gifs.sorted
    render 'gifs/index'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
