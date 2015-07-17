require 'rails_helper'

RSpec.describe "TestPaperQuestions", type: :request do
  describe "GET /test_paper_questions" do
    it "works! (now write some real specs)" do
      get test_paper_questions_path
      expect(response).to have_http_status(200)
    end
  end
end
