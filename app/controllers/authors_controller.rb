class AuthorsController < ApplicationController
  def index
    @authors = Author.all.page(params[:page]).per(10)
  end

  def show
    @author = Author.find_by(id: params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find_by(id: params[:id])
  end

  def update
    author = Author.find_by(id: params[:id])

    if author.update(author_params)
      redirect_to author
    else
      render 'edit'
    end
  end

  def destroy
    author = Author.find_by(id: params[:id])
    author.destroy

    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:full_name)
  end
end