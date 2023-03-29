require 'rails_helper'

RSpec.describe UsersController, type: :request do

  describe "GET /users" do
    it "renders a successful response" do
      get "/users"
      expect(response).to be_successful
    end
  end

  describe "GET /users/:id" do
    let!(:user) { User.create(full_name: 'Test') }

    it "renders a successful response" do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /users" do
    let(:valid_attributes) { { full_name: "John Doe" } }

    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post "/users", params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end
  end

  describe "PUT /users/:id" do
    let!(:user) { User.create(full_name: 'Test') }
    let(:new_attributes) { { full_name: "New name" } }

    it "updates the requested user" do
      put "/users/#{user.id}", params: { user: new_attributes }
      user.reload
      expect(user.full_name).to eq("New name")
    end
  end

  describe "DELETE /users/:id" do
    let!(:user) { User.create(full_name: 'Test') }

    it "destroys the requested user" do
      expect {
        delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
    end
  end
end