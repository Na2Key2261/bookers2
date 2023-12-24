class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
  @book = Book.new(book_params)
  @book.user = current_user
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index  # 正しいフォームを再表示するように修正
    end
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user 
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id]) #test
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
