require "rails_helper"

RSpec.describe "/rooms", type: :request do
  let(:login_info) do
     {
    name: "kurisaki",
    email: "kurisaki@example.com",
    password: "password-00"
    }
  end

  before do
    @user = User.register(
      login_info[:name],
      login_info[:email],
      login_info[:password]
    ).data
    @user.rooms << build_list(:room, 2)
  end

  describe "GET /rooms" do
    it "returns 200 ok with rooms" do
      user = User.login(login_info[:email], login_info[:password]).data
      session_id = user.session_id
      cookies[:session_id] = session_id
      get "/rooms"
      byebug
      json = parse_json(response)
      expect(json["data"].length).to eq 2
    end
  end
end
