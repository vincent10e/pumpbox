module CustomizedConceptsHelper

  def show_video_or_not(concept)
    if !concept.video.blank?
      content_tag(:div, class: "course-video-wrapper") do
        youtube_embed(concept.video)
      end
    end
  end

  def show_collect_video_button(concept)
    if current_user.collect_videos.find_by_url(concept.video).blank? && !concept.video.blank?
      content_tag(:button, "收藏影片", class: "btn btn-primary", "data-toggle" => "modal", "data-target" => ".collect_video_modal")
    else
      if !concept.video.blank?
        content_tag(:button, "已收藏", class: "btn btn-default", disabled: "disabled")  
      end  
    end
  end

end

