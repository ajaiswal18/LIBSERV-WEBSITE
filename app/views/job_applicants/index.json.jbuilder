json.array!(@job_applicants) do |job_applicant|
  json.extract! job_applicant, :id, :name, :emailid, :contact_no, :applying_for, :attachment
  json.url job_applicant_url(job_applicant, format: :json)
end
