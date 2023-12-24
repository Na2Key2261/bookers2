class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    # ユーザー一覧の処理を追加する（例：全てのユーザーを取得する）
    @users = User.all
    @book = Book.new
    @user = current_user


  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    

  end

  def update

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user)
    else
      render "edit"

    end
  end


  def create
    @book = Book.new(book_params)
    @book.user = current_user

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else

      render :new  # 正しいフォームを再表示するように修正
    end
  end


  private
  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
