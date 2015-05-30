require 'rails_helper'

RSpec.describe "CustomizedConcepts", type: :request do
  describe "GET /customized_concepts" do
    it "works! (now write some real specs)" do
      get customized_concepts_path
      expect(response).to have_http_status(200)
    end
  end
end
