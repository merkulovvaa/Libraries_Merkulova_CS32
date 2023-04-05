require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_in" do
    it "renders the new user session form" do
      get new_user_session_path
      expect(response.status).to eq(200)
    end

    it "authenticates the user" do
      user = User.create(email: "test@example.com", password: "password")
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      expect(response).to redirect_to(root_path)
    end
  end
end
