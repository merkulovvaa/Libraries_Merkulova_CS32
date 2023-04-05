require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_up" do
    it "renders the new user registration form" do
      get new_user_registration_path
      expect(response.status).to eq(200)
    end

    it "creates a new user" do
      expect {
        post user_registration_path, params: { user: { email: "test@example.com", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end
  end
end
