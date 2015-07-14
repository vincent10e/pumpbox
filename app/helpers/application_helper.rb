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

  def link_to_add_fields(name, f, association, cssClass, title)  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
      render(association.to_s.singularize + "_fields", :f => builder)  
    end  
    link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => cssClass, :title => title, remote: true
  end  

  def link_to_remove_fields(name, f)  
    f.hidden_field(:_destroy) + link_to(name, "#", :onclick => h("remove_fields(this)"), remote: true)
  end  

  def number_to_letter(answer)
    case answer.to_i
    when 1
      "A"
    when 2
      "B"
    when 3
      "C"
    when 4
      "D"
    when 5
      "E"
    when 6
      "F"
    end
  end

end
