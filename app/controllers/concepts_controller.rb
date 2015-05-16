class ConceptsController < ApplicationController

	def show 
		@concept = Concept.find(params[:id])
	end
end
