require "rails_helper"

RSpec.describe TestPaperQuestionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_paper_questions").to route_to("test_paper_questions#index")
    end

    it "routes to #new" do
      expect(:get => "/test_paper_questions/new").to route_to("test_paper_questions#new")
    end

    it "routes to #show" do
      expect(:get => "/test_paper_questions/1").to route_to("test_paper_questions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_paper_questions/1/edit").to route_to("test_paper_questions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_paper_questions").to route_to("test_paper_questions#create")
    end

    it "routes to #update" do
      expect(:put => "/test_paper_questions/1").to route_to("test_paper_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_paper_questions/1").to route_to("test_paper_questions#destroy", :id => "1")
    end

  end
end
