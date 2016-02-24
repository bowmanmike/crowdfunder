json.array!(@users) do |user|
  json.extract! user, :id, :email, :crypted_password, :salt, :first_name, :last_name
  json.url user_url(user, format: :json)
end
