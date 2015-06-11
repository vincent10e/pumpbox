require "rails_helper"

RSpec.describe TestAttemptsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_attempts").to route_to("test_attempts#index")
    end

    it "routes to #new" do
      expect(:get => "/test_attempts/new").to route_to("test_attempts#new")
    end

    it "routes to #show" do
      expect(:get => "/test_attempts/1").to route_to("test_attempts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/test_attempts/1/edit").to route_to("test_attempts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_attempts").to route_to("test_attempts#create")
    end

    it "routes to #update" do
      expect(:put => "/test_attempts/1").to route_to("test_attempts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/test_attempts/1").to route_to("test_attempts#destroy", :id => "1")
    end

  end
end
