class TestsController < ApplicationController
  def index
    @concept = CustomizedConcept.find(params[:customized_concept_id])
    @tests = @concept.tests
  end
end
