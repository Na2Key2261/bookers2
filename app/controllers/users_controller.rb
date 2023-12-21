class UsersController < ApplicationController
  def index
    # ユーザー一覧の処理を追加する（例：全てのユーザーを取得する）
    @users = User.all
    @books = Book.all

  end
  def show
    @user = User.find(params[:id])

    @books = @user.books
    @book = Book.new# またはデータベースから適切な本を取得するコード
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
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

  
end
