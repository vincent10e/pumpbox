module CustomizedConceptsHelper

  def show_video_or_not(concept)
    if !concept.video.blank?
      content_tag(:div, class: "course-video-wrapper") do
        youtube_embed(concept.video)
      end
    end
  end

end

