require 'rails_helper'

RSpec.describe AuthorsController, type: :request do

  describe "GET /authors" do
    it "renders a successful response" do
      get "/authors"
      expect(response).to be_successful
    end
  end

  describe "GET /authors/:id" do
    let!(:author) { Author.create(full_name: 'Test') }

    it "renders a successful response" do
      get "/authors/#{author.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /authors" do
    let(:valid_attributes) { { full_name: "Test" } }

    context "with valid attributes" do
      it "creates a new author" do
        expect {
          post "/authors", params: { author: valid_attributes }
        }.to change(Author, :count).by(1)
      end
    end
  end

  describe "PUT /authors/:id" do
    let!(:author) { Author.create(full_name: 'Test') }
    let(:new_attributes) { { full_name: "New name" } }

    it "updates the requested user" do
      put "/authors/#{author.id}", params: { author: new_attributes }
      author.reload
      expect(author.full_name).to eq("New name")
    end
  end

  describe "DELETE /authors/:id" do
    let!(:author) { Author.create(full_name: 'Test') }

    it "destroys the requested user" do
      expect {
        delete "/authors/#{author.id}"
      }.to change(Author, :count).by(-1)
    end
  end
end