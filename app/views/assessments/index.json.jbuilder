json.array!(@assessments) do |assessment|
  json.extract! assessment, :id, :name, :test_code
  json.url assessment_url(assessment, format: :json)
end
