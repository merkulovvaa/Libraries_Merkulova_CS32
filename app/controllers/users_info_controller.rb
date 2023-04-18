class UsersInfoController < ApplicationController
  def index
    @library = Library.find_by(id: params[:id])
    @users = @library.users.page(params[:page]).per(10)
  end

  def show
    @reader_card = ReaderCard.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
    @library = Library.find_by(id: params[:id])
  end
end
