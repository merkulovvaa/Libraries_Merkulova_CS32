require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET /users" do
    let!(:auth_user) { User.create(full_name: 'Test', email: 'auth_test@gmail.com', password: 'password') }

    it "renders a successful response" do
      sign_in auth_user

      get "/users"
      expect(response).to be_successful
    end
  end

  describe "GET /users/:id" do
    let!(:user) { User.create(full_name: 'Test', email: 'test@gmail.com', password: 'password') }

    it "renders a successful response" do
      sign_in user

      get "/users/#{user.id}"
      expect(response).to be_successful
    end
  end

  describe "PUT /users/:id" do
    let!(:user) { User.create(full_name: 'Test', email: 'test@gmail.com', password: 'password') }
    let(:new_attributes) { { full_name: "New name" } }

    it "updates the requested user" do
      sign_in user

      put "/users/#{user.id}", params: { user: new_attributes }
      user.reload
      expect(user.full_name).to eq("New name")
    end
  end

  describe "DELETE /users/:id" do
    let!(:user) { User.create(full_name: 'Test', email: 'test@gmail.com', password: 'password') }

    it "destroys the requested user" do
      sign_in user

      expect {
        delete "/users/#{user.id}"
      }.to change(User, :count).by(-1)
    end
  end
end