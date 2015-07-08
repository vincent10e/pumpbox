require 'rails_helper'

RSpec.describe "CollectCourses", type: :request do
  describe "GET /collect_courses" do
    it "works! (now write some real specs)" do
      get collect_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
