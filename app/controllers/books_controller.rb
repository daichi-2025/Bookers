class BooksController < ApplicationController
  def new
    @booker = Book.new
  end

  def create
    @booker = Book.new(booker_params)
    if @booker.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@booker.id)
    else 
      @bookers = Book.all
      flash.now[:alert] 
      render :index
    end
  end

  def index
    @bookers = Book.all
    @booker = Book.new
  end

  def show
    @booker = Book.find(params[:id])
  end

  def edit
    @booker = Book.find(params[:id])
  end

  def update
    booker = Book.find(params[:id])
    if booker.update(booker_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(booker.id)
    else 
      @booker = booker
      flash.now[:alert] 
      render :edit
    end

  end

  def destroy
    booker = Book.find(params[:id])
    booker.destroy
    redirect_to books_path
  end

  private
  def booker_params
    params.require(:book).permit(:title, :body)
  end

end
