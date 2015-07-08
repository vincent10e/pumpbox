require "rails_helper"

RSpec.describe CollectCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/collect_courses").to route_to("collect_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/collect_courses/new").to route_to("collect_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/collect_courses/1").to route_to("collect_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/collect_courses/1/edit").to route_to("collect_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/collect_courses").to route_to("collect_courses#create")
    end

    it "routes to #update" do
      expect(:put => "/collect_courses/1").to route_to("collect_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/collect_courses/1").to route_to("collect_courses#destroy", :id => "1")
    end

  end
end
