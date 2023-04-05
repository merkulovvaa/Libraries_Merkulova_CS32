require 'rails_helper'

RSpec.describe LibrariesController, type: :request do
  let!(:auth_user) { User.create(full_name: 'Test', email: 'auth_test@gmail.com', password: 'password') }

  describe "GET /libraries" do
    it "renders a successful response" do
      sign_in auth_user

      get "/libraries"
      expect(response).to be_successful
    end
  end

  describe "GET /libraries/:id" do
    let!(:library) { Library.create(name: 'Test') }

    it "renders a successful response" do
      sign_in auth_user

      get "/libraries/#{library.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /libraries" do
    let(:valid_attributes) { { name: "Test" } }

    context "with valid attributes" do
      it "creates a new library" do
        sign_in auth_user

        expect {
          post "/libraries", params: { library: valid_attributes }
        }.to change(Library, :count).by(1)
      end
    end
  end

  describe "PUT /libraries/:id" do
    let!(:library) { Library.create(name: 'Test') }
    let(:new_attributes) { { name: "New name" } }

    it "updates the requested user" do
      sign_in auth_user

      put "/libraries/#{library.id}", params: { library: new_attributes }
      library.reload
      expect(library.name).to eq("New name")
    end
  end

  describe "DELETE /libraries/:id" do
    let!(:library) { Library.create(name: 'Test') }

    it "destroys the requested user" do
      sign_in auth_user

      expect {
        delete "/libraries/#{library.id}"
      }.to change(Library, :count).by(-1)
    end
  end
end