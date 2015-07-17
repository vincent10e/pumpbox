json.array!(@test_paper_questions) do |test_paper_question|
  json.extract! test_paper_question, :id
  json.url test_paper_question_url(test_paper_question, format: :json)
end
