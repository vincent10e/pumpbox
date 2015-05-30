require "rails_helper"

RSpec.describe CustomizedConceptsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/customized_concepts").to route_to("customized_concepts#index")
    end

    it "routes to #new" do
      expect(:get => "/customized_concepts/new").to route_to("customized_concepts#new")
    end

    it "routes to #show" do
      expect(:get => "/customized_concepts/1").to route_to("customized_concepts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/customized_concepts/1/edit").to route_to("customized_concepts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/customized_concepts").to route_to("customized_concepts#create")
    end

    it "routes to #update" do
      expect(:put => "/customized_concepts/1").to route_to("customized_concepts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/customized_concepts/1").to route_to("customized_concepts#destroy", :id => "1")
    end

  end
end
