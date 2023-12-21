class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
    redirect_to post_images_path, notice: 'ユーザーを登録しました。'
  else
    render :new

  end

  end
end
