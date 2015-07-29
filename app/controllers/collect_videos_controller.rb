class CollectVideosController < ApplicationController

  def create
    @collect_video = CollectVideo.new(collect_course_params)
    @course = Course.find(params[:course_id])
    @customized_concept = CustomizedConcept.find(params[:customized_concept_id])

    respond_to do |format|
      if @collect_video.save
        format.html { redirect_to course_customized_concept_path(@course, @customized_concept), notice: 'collect video was successfully created.' }
      else
        format.html { render "customized_concepts/show" }
      end
    end

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def collect_course_params
      params.require(:collect_video).permit(:user_id, :title, :url)
    end
end
