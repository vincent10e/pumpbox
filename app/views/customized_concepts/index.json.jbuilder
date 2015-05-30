json.array!(@customized_concepts) do |customized_concept|
  json.extract! customized_concept, :id, :course_id, :title, :description, :video, :lecture
  json.url customized_concept_url(customized_concept, format: :json)
end
