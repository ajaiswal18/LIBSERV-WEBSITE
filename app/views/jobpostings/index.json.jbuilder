json.array!(@jobpostings) do |jobposting|
  json.extract! jobposting, :id
  json.url jobposting_url(jobposting, format: :json)
end
