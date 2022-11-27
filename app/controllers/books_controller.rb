class BooksController < ApplicationController
  before_action :is_matching_login_user, only:[:edit, :update]
  def index
    @booknew = Book.new
    @books = Book.all
    @book = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = User.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book). permit(:title, :body)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end
end