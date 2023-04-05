require 'rails_helper'

RSpec.describe ReaderCardsController, type: :request do
  let!(:library) { Library.create(name: 'library') }
  let!(:user) { User.create(full_name: 'Test', email: 'test@gmail.com', password: 'password') }

  describe "GET /reader_cards" do
    it "renders a successful response" do
      sign_in user

      get "/reader_cards"
      expect(response).to be_successful
    end
  end

  describe "GET /reader_cards/:id" do
    let!(:reader_card) { ReaderCard.create(user: user, library: library) }

    it "renders a successful response" do
      sign_in user

      get "/reader_cards/#{reader_card.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /reader_cards" do
    let(:valid_attributes) { { user_id: user.id, library_id: library.id } }

    context "with valid attributes" do
      it "creates a new reader_card" do
        sign_in user

        expect {
          post "/reader_cards", params: { reader_card: valid_attributes }
        }.to change(ReaderCard, :count).by(1)
      end
    end
  end

  describe "PUT /reader_cards/:id" do
    let!(:user2) { User.create(full_name: 'Test', email: 'test2@gmail.com', password: 'password') }
    let!(:reader_card) { ReaderCard.create(user: user, library: library) }
    let(:new_attributes) { { user_id: user2.id } }

    it "updates the requested reader_cards" do
      sign_in user

      put "/reader_cards/#{reader_card.id}", params: { reader_card: new_attributes }
      reader_card.reload
      expect(reader_card.user_id).to eq(user2.id)
    end
  end

  describe "DELETE /reader_cards/:id" do
    let!(:reader_card) { ReaderCard.create(user: user, library: library) }

    it "destroys the requested reader_cards" do
      sign_in user

      expect {
        delete "/reader_cards/#{reader_card.id}"
      }.to change(ReaderCard, :count).by(-1)
    end
  end
end