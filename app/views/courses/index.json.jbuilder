json.array!(@courses) do |course|
  json.extract! course, :id, :teacher_id, :title, :overview
  json.url course_url(course, format: :json)
end
