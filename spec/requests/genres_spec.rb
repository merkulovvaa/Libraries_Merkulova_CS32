require 'rails_helper'

RSpec.describe GenresController, type: :request do

  describe "GET /genres" do
    it "renders a successful response" do
      get "/genres"
      expect(response).to be_successful
    end
  end

  describe "GET /genres/:id" do
    let!(:genre) { Genre.create(name: 'Test') }

    it "renders a successful response" do
      get "/genres/#{genre.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /genres" do
    let(:valid_attributes) { { name: "Test" } }

    context "with valid attributes" do
      it "creates a new genre" do
        expect {
          post "/genres", params: { genre: valid_attributes }
        }.to change(Genre, :count).by(1)
      end
    end
  end

  describe "PUT /genres/:id" do
    let!(:genre) { Genre.create(name: 'Test') }
    let(:new_attributes) { { name: "New name" } }

    it "updates the requested genre" do
      put "/genres/#{genre.id}", params: { genre: new_attributes }
      genre.reload
      expect(genre.name).to eq("New name")
    end
  end

  describe "DELETE /genres/:id" do
    let!(:genre) { Genre.create(name: 'Test') }

    it "destroys the requested genres" do
      expect {
        delete "/genres/#{genre.id}"
      }.to change(Genre, :count).by(-1)
    end
  end
end