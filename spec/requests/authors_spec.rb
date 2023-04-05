require 'rails_helper'

RSpec.describe AuthorsController, type: :request do
  let!(:auth_user) { User.create(full_name: 'Test', email: 'auth_test@gmail.com', password: 'password') }

  describe "GET /authors" do
    it "renders a successful response" do
      sign_in auth_user

      get "/authors"
      expect(response).to be_successful
    end
  end

  describe "GET /authors/:id" do
    let!(:author) { Author.create(full_name: 'Test') }

    it "renders a successful response" do
      sign_in auth_user

      get "/authors/#{author.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /authors" do
    let(:valid_attributes) { { full_name: "Test" } }

    context "with valid attributes" do
      it "creates a new author" do
        sign_in auth_user

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
      sign_in auth_user

      put "/authors/#{author.id}", params: { author: new_attributes }
      author.reload
      expect(author.full_name).to eq("New name")
    end
  end

  describe "DELETE /authors/:id" do
    let!(:author) { Author.create(full_name: 'Test') }

    it "destroys the requested user" do
      sign_in auth_user

      expect {
        delete "/authors/#{author.id}"
      }.to change(Author, :count).by(-1)
    end
  end
end