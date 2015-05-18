class TestsController < ApplicationController
  def index
    @concept = Concept.find(params[:concept_id])
    @tests = @concept.tests
  end
end
