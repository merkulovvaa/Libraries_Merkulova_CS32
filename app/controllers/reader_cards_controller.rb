class ReaderCardsController < ApplicationController
  def index
    @reader_cards = ReaderCard.all
  end

  def show
    @reader_card = ReaderCard.find_by(id: params[:id])
  end

  def new
    @reader_card = ReaderCard.new
  end

  def create
    @reader_card = ReaderCard.new(reader_card_params)

    if @reader_card.save
      redirect_to reader_cards_path
    else
      render 'new'
    end
  end

  def edit
    @reader_card = ReaderCard.find_by(id: params[:id])
  end

  def update
    reader_card = ReaderCard.find_by(id: params[:id])

    if reader_card.update(reader_card_params)
      redirect_to reader_card
    else
      render 'edit'
    end
  end

  def destroy
    reader_card = ReaderCard.find_by(id: params[:id])
    reader_card.destroy

    redirect_to reader_cards_path
  end

  private

  def reader_card_params
    params.require(:reader_card).permit(:library_id, :user_id)
  end
end