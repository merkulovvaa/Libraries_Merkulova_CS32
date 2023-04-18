class BooksController < ApplicationController
  def index
    @books = BooksQuery.new(params).results.page(params[:page]).per(10)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    book = Book.find_by(id: params[:id])

    if book.update(book_params)
      redirect_to book
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy

    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :library_id)
  end
end