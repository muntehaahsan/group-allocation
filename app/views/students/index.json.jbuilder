json.array!(@students) do |student|
  json.extract! student, :id, :name, :email, :grade
  json.url student_url(student, format: :json)
end
