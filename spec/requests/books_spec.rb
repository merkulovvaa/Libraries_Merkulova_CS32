require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let!(:library)   { Library.create(name: 'library') }
  let!(:auth_user) { User.create(full_name: 'Test', email: 'auth_test@gmail.com', password: 'password') }


  describe "GET /books" do
    it "renders a successful response" do
      sign_in auth_user

      get "/books"
      expect(response).to be_successful
    end
  end

  describe "GET /books/:id" do
    let!(:book){ Book.create(library: library, title: 'test') }

    it "renders a successful response" do
      sign_in auth_user

      get "/books/#{book.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /books" do
    let(:valid_attributes) { { library_id: library.id, title: "Test" } }

    context "with valid attributes" do
      it "creates a new books" do
        sign_in auth_user

        expect {
          post "/books", params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end
    end
  end

  describe "PUT /books/:id" do
    let!(:book) { Book.create(library: library, title: 'Test') }
    let(:new_attributes) { { title: "New name" } }

    it "updates the requested genre" do
      sign_in auth_user

      put "/books/#{book.id}", params: { book: new_attributes }
      book.reload
      expect(book.title).to eq("New name")
    end
  end

  describe "DELETE /book/:id" do
    let!(:book) { Book.create(library: library, title: 'Test') }

    it "destroys the requested genres" do
      sign_in auth_user

      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)
    end
  end
end