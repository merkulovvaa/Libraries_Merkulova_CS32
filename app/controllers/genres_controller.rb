class GenresController < ApplicationController
  def index
    @genres = Genre.all.page(params[:page]).per(10)
  end

  def show
    @genre = Genre.find_by(id: params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genres_path
    else
      render 'new'
    end
  end

  def edit
    @genre = Genre.find_by(id: params[:id])
  end

  def update
    genre = Genre.find_by(id: params[:id])

    if genre.update(genre_params)
      redirect_to genre
    else
      render 'edit'
    end
  end

  def destroy
    genre = Genre.find_by(id: params[:id])
    genre.destroy

    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end