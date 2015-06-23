require "rails_helper"

RSpec.describe TestPapersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_papers").to route_to("test_papers#index")
    end

    it "routes to #new" do
      expect(:get => "/test_papers/new").to route_to("test_papers#new")
    end

    it "routes to #show" do
      expect(:get => "/test_papers/1").to route_to("test_papers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_papers/1/edit").to route_to("test_papers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_papers").to route_to("test_papers#create")
    end

    it "routes to #update" do
      expect(:put => "/test_papers/1").to route_to("test_papers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_papers/1").to route_to("test_papers#destroy", :id => "1")
    end

  end
end
