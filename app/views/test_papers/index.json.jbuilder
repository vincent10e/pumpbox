json.array!(@test_papers) do |test_paper|
  json.extract! test_paper, :id, :customized_concept_id, :user
  json.url test_paper_url(test_paper, format: :json)
end
