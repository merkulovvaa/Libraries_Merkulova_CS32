class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def show
    @library = Library.find_by(id: params[:id])
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.new(library_params)

    if @library.save
      redirect_to libraries_path
    else
      render 'new'
    end
  end

  def edit
    @library = Library.find_by(id: params[:id])
  end

  def update
    library = Library.find_by(id: params[:id])

    if library.update(library_params)
      redirect_to library
    else
      render 'edit'
    end
  end

  def destroy
    library = Library.find_by(id: params[:id])
    library.destroy

    redirect_to libraries_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :address, :phone_number)
  end
end
