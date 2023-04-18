class LibraryInfoController < ApplicationController
  def index
    @libraries = LibrariesInfoQuery.new(params).results.page(params[:page]).per(10)
  end

  def show
    @library = Library.find_by(id: params[:id])
  end
end
