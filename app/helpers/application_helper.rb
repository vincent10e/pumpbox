module ApplicationHelper

  def image_placeholder(args)
    width = args[:width] || '300'
    height = args[:height] || '300'
    text = args[:text] || "#{width} x #{height}"
    classes = args[:class] || ""

    image_tag "http://placehold.it/#{width}x#{height}&text=#{text}", :class => "#{classes}"
  end

  def link_active?(path)
    'active' if current_page?(path)
  end

  def render_course_status(course_status_code)
    case course_status_code
    when 0
      raw '<i class="fa fa-lock"></i>'
    when 1
      raw '<i class="fa fa-circle available"></i>'
    when 2
      raw '✔'
    end
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    raw %Q{<iframe class="video-wrapper" title="YouTube video player" src="http://www.youtube.com/embed/#{ youtube_id }?rel=0&amp;frameborder="0" allowfullscreen></iframe>}
  end

end
