json.array!(@groups) do |group|
  json.extract! group, :id, :teacher_id, :name, :group_code
  json.url group_url(group, format: :json)
end
