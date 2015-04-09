module ApplicationHelper

  def image_placeholder(args)
    width = args[:width] || '300'
    height = args[:height] || '300'
    text = args[:text] || "#{width} x #{height}"
    classes = args[:class] || ""

    image_tag "http://placehold.it/#{width}x#{height}&text=#{text}", :class => "#{classes}"
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

end
