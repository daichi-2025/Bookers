class BooksController < ApplicationController
  def new
    @booker = Booker.new
  end

  def create
    @booker = Booker.new(booker_params)
    if @booker.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@booker.id)
    else 
      @bookers = Booker.all
      flash.now[:notice] 
      render :index
    end
  end

  def index
    @bookers = Booker.all
    @booker = Booker.new
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    if booker.update(booker_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(booker.id)
    else 
      @booker = booker
      flash.now[:notice] 
      render :edit
    end

  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to books_path(booker.id)
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end

end
