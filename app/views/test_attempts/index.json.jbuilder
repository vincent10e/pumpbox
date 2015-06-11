json.array!(@test_attempts) do |test_attempt|
  json.extract! test_attempt, :id, :customized_concept_id, :user
  json.url test_attempt_url(test_attempt, format: :json)
end
