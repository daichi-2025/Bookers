class BookersController < ApplicationController
  def new
    @bookers = Booker.all
    @booker = Booker.new
  end

  def create
    booker = Booker.new(booker_params)
    booker.save
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end
end
