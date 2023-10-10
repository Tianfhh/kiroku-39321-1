require 'rails_helper'

RSpec.describe "Records", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/records/index"
      expect(response).to have_http_status(:success)
    end
  end

end
